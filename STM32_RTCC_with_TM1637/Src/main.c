
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  ** This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether 
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
  *
  * COPYRIGHT(c) 2018 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  ** This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
  *
  * COPYRIGHT(c) 2018 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32f1xx_hal.h"
#include "rtc.h"
#include "gpio.h"
#include "TM1637.h"

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
extern const unsigned char seg_data[10];
/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
unsigned char inc_dec(signed char value, signed char value_max, signed char value_min);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* USER CODE END PFP */


/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  *
  * @retval None
 */
int main(void)
{
  /* USER CODE BEGIN 1 */
  RTC_TimeTypeDef sTime;
  RTC_DateTypeDef sDate;

  unsigned char set = 0x00;
  unsigned char time_menu = 0x00;
  unsigned char auto_scroll = 0x00;
  unsigned char toggle = 0x00;
  /* USER CODE END 1 */

  /* MCU Configuration----------------------------------------------------------*/

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
  MX_RTC_Init();
  TM1637_init();

  HAL_RTC_GetTime(&hrtc, &sTime, RTC_FORMAT_BIN);
  HAL_RTC_GetDate(&hrtc, &sDate, RTC_FORMAT_BIN);

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */

  //hrtc.Instance = RTC;

  while (1)
  {
  /* USER CODE END WHILE */

  /* USER CODE BEGIN 3 */

	  if(HAL_GPIO_ReadPin(Key_B_GPIO_Port, Key_B_Pin) == 0)
	  {
		  HAL_Delay(40);

		  while(HAL_GPIO_ReadPin(Key_B_GPIO_Port, Key_B_Pin) == 0);


		  if(set == 1)
		  {
			  time_menu++;
		  }
		  else
		  {
			  time_menu = 1;
			  auto_scroll = 0;
		  }

		  set = 1;
		  toggle = 1;

		  TM1637_clear();
	  }

	  if(HAL_GPIO_ReadPin(Key_C_GPIO_Port, Key_C_Pin) == 0)
	  {
		  HAL_Delay(10);

		  if(set == 0)
		  {
			  time_menu++;
		  }
	  }

	  if(HAL_GPIO_ReadPin(User_Key_GPIO_Port, User_Key_Pin) == 0)
	  {
		  while(HAL_GPIO_ReadPin(User_Key_GPIO_Port, User_Key_Pin) == 0);
		  auto_scroll ^= 1;
	  }

	  switch(set)
	  {
	  	  case 1:
	  	  {
				switch(time_menu)
				{
				    case 1:
					{
						TM1637_display_segments(0, 0x00, 0);
						TM1637_display_segments(1, 0x00, 1);

						sTime.Hours = inc_dec(sTime.Hours, 23, 0);
						break;
					}

					case 2:
					{
						TM1637_display_segments(2, 0x00, 0);
						TM1637_display_segments(3, 0x00, 0);

						sTime.Minutes = inc_dec(sTime.Minutes, 59, 0);
						break;
					}

					case 3:
					{
						TM1637_display_segments(0, 0x00, 0);
						TM1637_display_segments(1, 0x00, 0);

						sDate.Date = inc_dec(sDate.Date, 31, 1);
						break;
					}

					case 4:
					{
						TM1637_display_segments(2, 0x00, 0);
						TM1637_display_segments(3, 0x00, 0);

						sDate.Month = inc_dec(sDate.Month, 12, 1);
						break;
					}

					case 5:
					{
						TM1637_display_segments(0, seg_data[2], 0);
						TM1637_display_segments(1, seg_data[0], 0);
						TM1637_display_segments(2, 0x00, 0);
						TM1637_display_segments(3, 0x00, 0);

						sDate.Year = inc_dec(sDate.Year, 99, 0);
						break;
					}

					default:
					{
						time_menu = 0;
						set = 0;
						toggle = 1;
						break;
					}
				}

				HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BIN);
				HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BIN);

				break;
	  	  }

		  default:
		  {
			  HAL_RTC_GetTime(&hrtc, &sTime, RTC_FORMAT_BIN);
			  HAL_RTC_GetDate(&hrtc, &sDate, RTC_FORMAT_BIN);

			  toggle ^= 1;

			  switch(auto_scroll)
			  {
			  	  case 1:
			  	  {
			  		time_menu++;
			  		HAL_Delay(600);
			  		break;
			  	  }

			  	  default:
			  	  {
			  		  time_menu = 1;
			  		  break;
			  	  }
			  }

			  HAL_Delay(100);
			  break;
		  }
	  }


	  switch(time_menu)
	  {
	  	    case 1:

	  	    case 2:
	  	    {
	  		    TM1637_display_segments(0, seg_data[(sTime.Hours / 10)], 0);
			    TM1637_display_segments(1, seg_data[(sTime.Hours % 10)], toggle);
			    TM1637_display_segments(2, seg_data[(sTime.Minutes / 10)], 0);
			    TM1637_display_segments(3, seg_data[(sTime.Minutes % 10)], 0);
			    break;
	  	  	}

			case 3:

			case 4:
			{
				  TM1637_display_segments(0, seg_data[(sDate.Date / 10)], 0);
				  TM1637_display_segments(1, seg_data[(sDate.Date % 10)], 0);
				  TM1637_display_segments(2, seg_data[(sDate.Month / 10)], 0);
				  TM1637_display_segments(3, seg_data[(sDate.Month % 10)], 0);
				  break;
			}

			case 5:
			{
				  TM1637_display_segments(0, seg_data[2], 0);
				  TM1637_display_segments(1, seg_data[0], 0);
				  TM1637_display_segments(2, seg_data[(sDate.Year / 10)], 0);
				  TM1637_display_segments(3, seg_data[(sDate.Year % 10)], 0);
				  break;
			}

			default:
			{
				time_menu = 1;
				break;
			}
	  }
  }
  /* USER CODE END 3 */

}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{

  RCC_OscInitTypeDef RCC_OscInitStruct;
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_PeriphCLKInitTypeDef PeriphClkInit;

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE|RCC_OSCILLATORTYPE_LSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL8;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_RTC;
  PeriphClkInit.RTCClockSelection = RCC_RTCCLKSOURCE_LSE;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    /**Enables the Clock Security System 
    */
  HAL_RCC_EnableCSS();

    /**Configure the Systick interrupt time 
    */
  HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

    /**Configure the Systick 
    */
  HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

  /* SysTick_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}


unsigned char inc_dec(signed char value, signed char value_max, signed char value_min)
{
	if(HAL_GPIO_ReadPin(Key_D_GPIO_Port, Key_D_Pin) == 0)
    {
		value++;

		if(value > value_max)
		{
			value = value_min;
		}
    }

	if(HAL_GPIO_ReadPin(Key_A_GPIO_Port, Key_A_Pin) == 0)
	{
		value--;

		if(value < value_min)
		{
			value = value_max;
		}
	}

	return (value);
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @param  file: The file name as string.
  * @param  line: The line in file as a number.
  * @retval None
  */
void _Error_Handler(char *file, int line)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  while(1)
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
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
