/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "AM1011A.h"
#include "ILI932x.h"
#include "BMP.h"
#include <math.h>
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
#define angular_range		((110.0 / 180.0) * 3.142)
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

/* USER CODE BEGIN PV */
volatile uint16_t adc_res[2];
const int adc_ch_count = 2;
volatile int adc_comp = 0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ADC1_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
void load_background_graphics();
void update_lines(uint16_t x_pos, uint16_t y_pos, uint16_t len, float value, uint16_t colour);
void update_dial(uint16_t x_pos, uint16_t y_pos, uint16_t len, float value, float past_value, uint16_t back_colour, uint16_t colour);
void update_dynamic_graphice(float t, float rh);
float constrain(float value, float min_value, float max_value);
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
	char buffer[40];
	float t = 0;
	float rh = 0;
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_ADC1_Init();
  /* USER CODE BEGIN 2 */
  TFT_init();
  load_background_graphics();
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */
	  HAL_ADC_Start_DMA(&hadc1, adc_res, 2);
	  while(adc_comp == 0);

	  t = AM1101A_get_T(adc_res[0]);
	  rh = AM1101A_get_RH(adc_res[1]);

	  t = constrain(t, 0.0, 100.0);
	  rh = constrain(rh, 0.0, 100.0);

	  update_dynamic_graphice(t, rh);
	  adc_comp = 0;
	  delay_ms(400);
    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_ADC;
  PeriphClkInit.AdcClockSelection = RCC_ADCPCLK2_DIV6;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }

  /** Enables the Clock Security System
  */
  HAL_RCC_EnableCSS();
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */

  /** Common config
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ScanConvMode = ADC_SCAN_ENABLE;
  hadc1.Init.ContinuousConvMode = DISABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 2;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_14;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SamplingTime = ADC_SAMPLETIME_1CYCLE_5;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_15;
  sConfig.Rank = ADC_REGULAR_RANK_2;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel1_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOC, TFT_RST_Pin|TFT_WR_Pin|TFT_RD_Pin|TFT_CS_Pin
                          |TFT_RS_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(TFT_BL_GPIO_Port, TFT_BL_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, TFT_D0_Pin|TFT_D1_Pin|TFT_D2_Pin|TFT_D10_Pin
                          |TFT_D11_Pin|TFT_D12_Pin|TFT_D13_Pin|TFT_D14_Pin
                          |TFT_D15_Pin|TFT_D3_Pin|TFT_D4_Pin|TFT_D5_Pin
                          |TFT_D6_Pin|TFT_D7_Pin|TFT_D8_Pin|TFT_D9_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : TFT_RST_Pin TFT_WR_Pin TFT_RD_Pin TFT_CS_Pin
                           TFT_RS_Pin */
  GPIO_InitStruct.Pin = TFT_RST_Pin|TFT_WR_Pin|TFT_RD_Pin|TFT_CS_Pin
                          |TFT_RS_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pin : TFT_BL_Pin */
  GPIO_InitStruct.Pin = TFT_BL_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(TFT_BL_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : TFT_D0_Pin TFT_D1_Pin TFT_D2_Pin TFT_D10_Pin
                           TFT_D11_Pin TFT_D12_Pin TFT_D13_Pin TFT_D14_Pin
                           TFT_D15_Pin TFT_D3_Pin TFT_D4_Pin TFT_D5_Pin
                           TFT_D6_Pin TFT_D7_Pin TFT_D8_Pin TFT_D9_Pin */
  GPIO_InitStruct.Pin = TFT_D0_Pin|TFT_D1_Pin|TFT_D2_Pin|TFT_D10_Pin
                          |TFT_D11_Pin|TFT_D12_Pin|TFT_D13_Pin|TFT_D14_Pin
                          |TFT_D15_Pin|TFT_D3_Pin|TFT_D4_Pin|TFT_D5_Pin
                          |TFT_D6_Pin|TFT_D7_Pin|TFT_D8_Pin|TFT_D9_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}


void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	adc_comp = 1;
}

/* USER CODE BEGIN 4 */
void load_background_graphics()
{
	TFT_draw_BMP(0, 0, 320, 240, gImage_BMP);
	TFT_print_str(20, 16, 1, BLACK, WHITE, "AM1011A Relative Humidity & Temperature Sensor");
}


void update_lines(uint16_t x_pos, uint16_t y_pos, uint16_t len, float value, uint16_t colour)
{
	float l = 0;

	l = map_value(value, 0.0, 100.0, -(angular_range), angular_range);
	TFT_draw_line(x_pos, y_pos, (uint16_t)(x_pos + (len * sin(l))), (uint16_t)(y_pos - (len * cos(l))), colour);
	TFT_draw_line(x_pos, y_pos, (uint16_t)(x_pos - ((len / 3) * sin(l))), (uint16_t)(y_pos + ((len / 3) * cos(l))), colour);
}


void update_dial(uint16_t x_pos, uint16_t y_pos, uint16_t len, float value, float past_value, uint16_t back_colour, uint16_t colour)
{
	update_lines(x_pos, y_pos, len, past_value, back_colour);
	TFT_draw_circle(x_pos, y_pos, 3, YES, colour);
	update_lines(x_pos, y_pos, len, value, colour);
}


void update_dynamic_graphice(float t, float rh)
{
	char buffer[40];
	static float t_past;
	static float rh_past;

	update_dial(80, 114, 32, t, t_past, WHITE, BLUE);
	update_dial(236, 114, 32, rh, rh_past, WHITE, BLUE);

	sprintf(buffer, "%2.1f'C ", t);
	TFT_print_str(70, 200, 2, RED, WHITE, buffer);

	sprintf(buffer, "%3.1f ",  rh);
	TFT_print_str(230, 200, 2, GREEN, WHITE, buffer);

	TFT_print_str(256, 200, 2, GREEN, WHITE, "% ");

	t_past = t;
	rh_past = rh;
}


float constrain(float value, float min_value, float max_value)
{
	if(value > max_value)
	{
		return max_value;
	}

	else if(value < min_value)
	{
		return min_value;
	}

	else
	{
		return value;
	}
}


/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
