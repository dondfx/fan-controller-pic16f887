# 🌀 Remote Controlled Fan Controller

[![MPLAB CI](https://github.com/your-username/remote-fan-controller/actions/workflows/mplab.yml/badge.svg)](https://github.com/your-username/remote-fan-controller/actions/workflows/mplab.yml)

A modular PIC16F887-based embedded system that controls a wall fan with IR remote support, push-button input, visual LED indicators, PWM buzzer, and TRIAC-based speed/swing control.

---

## 📘 Overview

This project implements a **remote-controlled fan** using the **PIC16F887** microcontroller. It supports **infrared remote decoding**, **manual push-buttons**, **LED feedback indicators**, and a **delay-off timer**.  

---

## 📸 Device Preview

<p align="center">
  <img src="assets/fan_controller.png" alt="Fan Controller Preview" width="500"/>
</p>

---

## ✅ Features

- 🎛️ **TRIAC-Based Fan Speed Control**  
  Provides three discrete speed levels (LOW, MEDIUM, HIGH) and full OFF.

- 🌬️ **Swing Control**  
  Toggle swing function via IR remote or push button.

- 📡 **IR Remote Decoder**  
  Decodes IR commands from a TSOP1838 sensor. Supports ON, OFF, SWING, and TIMER.

- ⏳ **Delay-Off Timer**  
  User-configurable 30/60/120-minute shutdown via IR remote.

- 🔔 **PWM Buzzer**  
  Generates tones as audible feedback for remote/button actions.

- 💡 **LED Indicators**  
  Show active fan speed and swing with dedicated LEDs.

- 🔘 **Manual Push Buttons**  
  Hardware buttons on PORTB provide ON, OFF, and SWING control as a fallback or supplement to the remote.

- 🔄 **Robust Interrupt Handling**  
  External interrupt for IR, IOCB for buttons, Timer0 for periodic tasks, and Timer2 for PWM.

- ⚡ **Clean Modular Codebase**  
  Professionally structured with split `.h` and `.c` files for each peripheral/feature.

---

## 🧠 How It Works

1. **IR Remote Input**  
   - External interrupt captures IR edges.  
   - Timer1 timestamps are stored and processed by the IR decoder.  
   - Decoded commands are passed to `admin_functions`.

2. **Manual Button Input**  
   - IOCB (Interrupt-On-Change) detects button presses.  
   - Debounced and processed identically to IR commands.

3. **Admin Functions**  
   - Central module that updates fan speed, swing, and timer state.  
   - Controls LEDs, buzzer, and TRIACs accordingly.

4. **TRIAC Control**  
   - Discrete TRIACs drive fan coils for speed and swing.  
   - Outputs are active-low for safe operation.

5. **Delay-Off Timer**  
   - Implemented in software using Timer0 ticks.  
   - Shuts down fan after selected timeout.

6. **PWM Buzzer**  
   - Uses CCP2 with Timer2 to generate feedback tones.  

---

## ⚙️ Hardware Requirements

- **Microcontroller**: PIC16F887 (20 MHz crystal)  
- **IR Receiver**: TSOP1838 (38 kHz carrier)  
- **TRIAC Drivers**: 4 output channels (fan speed coils + swing)  
- **Push Buttons**: ON, OFF, SWING on PORTB  
- **LEDs**: Speed (3) and Swing indicators  
- **Buzzer**: Driven via PWM (CCP2 on RC1)  

---

## 📂 Project Structure

remote-fan-controller/
├── include/ # Header files
│ ├── admin_functions.h
│ ├── blink_swing.h
│ ├── button_handler.h
│ ├── debug_support.h
│ ├── decoder_buffer.h
│ ├── delay_ms.h
│ ├── delay_off.h
│ ├── external_interrupt_conf.h
│ ├── io_definitions.h
│ ├── iocb_config.h
│ ├── ir_definitions.h
│ ├── ir_functions.h
│ ├── pwm_config.h
│ ├── timer0_conf.h
│ ├── timer1_conf.h
│ ├── timer2_config.h
│ ├── triac_control.h
│ ├── uart_conf.h
│ └── uart_support.h
├── src/ # Source files
│ ├── admin_functions.c
│ ├── blink_swing.c
│ ├── button_handler.c
│ ├── debug_support.c
│ ├── decoder_buffer.c
│ ├── delay_ms.c
│ ├── delay_off.c
│ ├── external_interrupt_conf.c
│ ├── io_definitions.c
│ ├── iocb_config.c
│ ├── ir_functions.c
│ ├── pwm_config.c
│ ├── timer0_conf.c
│ ├── timer1_conf.c
│ ├── timer2_config.c
│ ├── triac_control.c
│ ├── uart_conf.c
│ └── uart_support.c
├── main.c # Main entry point
├── README.md # This file
└── LICENSE # MIT License

---

## 🛠️ Build & Flash

This project uses **MPLAB X IDE** with the **XC8 compiler**.

1. Open MPLAB X IDE.  
2. Create a new XC8 project for **PIC16F887**.  
3. Add all `.c` files to **Source Files**.  
4. Add all `.h` files to **Header Files**.  
5. Set project properties:  
   - **Device**: PIC16F887  
   - **Compiler**: XC8  
   - **Clock**: 20 MHz (HS Oscillator)  
6. Build and flash using a PIC programmer (e.g., PICkit 3/4).

---

## 🔧 Configuration Notes

- All header and source files have been **renamed to lowercase** for portability.  
- Configuration bits (`#pragma config`) are already set inside `main.c`.  
- No additional MPLAB settings are required apart from including all files in the project.  

---

## 📸 Future Enhancements

- EEPROM-based state retention (restore last fan speed on power-up).  
- Additional IR remote buttons for extended modes.  
- UART debug console for easier monitoring.  
- Auto-restart after brown-out or watchdog reset.

---

🪪 License: MIT © Lakmal Weerasinghe
