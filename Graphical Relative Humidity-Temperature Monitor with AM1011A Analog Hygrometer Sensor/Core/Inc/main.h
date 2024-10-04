/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f1xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define TFT_RST_Pin GPIO_PIN_0
#define TFT_RST_GPIO_Port GPIOC
#define TFT_WR_Pin GPIO_PIN_1
#define TFT_WR_GPIO_Port GPIOC
#define TFT_RD_Pin GPIO_PIN_2
#define TFT_RD_GPIO_Port GPIOC
#define TFT_BL_Pin GPIO_PIN_3
#define TFT_BL_GPIO_Port GPIOA
#define AN_CH1_Pin GPIO_PIN_4
#define AN_CH1_GPIO_Port GPIOC
#define AN_CH2_Pin GPIO_PIN_5
#define AN_CH2_GPIO_Port GPIOC
#define TFT_D0_Pin GPIO_PIN_0
#define TFT_D0_GPIO_Port GPIOB
#define TFT_D1_Pin GPIO_PIN_1
#define TFT_D1_GPIO_Port GPIOB
#define TFT_D2_Pin GPIO_PIN_2
#define TFT_D2_GPIO_Port GPIOB
#define TFT_D10_Pin GPIO_PIN_10
#define TFT_D10_GPIO_Port GPIOB
#define TFT_D11_Pin GPIO_PIN_11
#define TFT_D11_GPIO_Port GPIOB
#define TFT_D12_Pin GPIO_PIN_12
#define TFT_D12_GPIO_Port GPIOB
#define TFT_D13_Pin GPIO_PIN_13
#define TFT_D13_GPIO_Port GPIOB
#define TFT_D14_Pin GPIO_PIN_14
#define TFT_D14_GPIO_Port GPIOB
#define TFT_D15_Pin GPIO_PIN_15
#define TFT_D15_GPIO_Port GPIOB
#define TFT_CS_Pin GPIO_PIN_6
#define TFT_CS_GPIO_Port GPIOC
#define TFT_RS_Pin GPIO_PIN_7
#define TFT_RS_GPIO_Port GPIOC
#define TFT_D3_Pin GPIO_PIN_3
#define TFT_D3_GPIO_Port GPIOB
#define TFT_D4_Pin GPIO_PIN_4
#define TFT_D4_GPIO_Port GPIOB
#define TFT_D5_Pin GPIO_PIN_5
#define TFT_D5_GPIO_Port GPIOB
#define TFT_D6_Pin GPIO_PIN_6
#define TFT_D6_GPIO_Port GPIOB
#define TFT_D7_Pin GPIO_PIN_7
#define TFT_D7_GPIO_Port GPIOB
#define TFT_D8_Pin GPIO_PIN_8
#define TFT_D8_GPIO_Port GPIOB
#define TFT_D9_Pin GPIO_PIN_9
#define TFT_D9_GPIO_Port GPIOB

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
