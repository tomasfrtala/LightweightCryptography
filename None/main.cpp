/* 
 * File:   main.cpp
 * Author: Tomas Frtala
 *
 * Created on Streda, 2014, apríl 16, 16:03
 */

#include <Arduino.h>
#include "EEPROM.h"

// variables
#define DATALENGTH 1024

extern HardwareSerial Serial;

boolean beVerbose = true; // verbose some steps

// Data variables
char* plain = new char[DATALENGTH]; // 1 kB (1024 bytov) z max. 2 kB SRAM

// Manipulation variable declaration
unsigned long time, emit;

// Arduino variables
int ledPin = 13; // BT

int freeRam()
{
    extern int __heap_start, *__brkval;
    int v;
    return (int) &v - (__brkval == 0 ? (int) &__heap_start : (int) __brkval);
}

void createDataArray()
{
    Serial.print(F("Creating array of data"));
    time = micros(); // time start

    int i, j;
    for (i = j = 0; i < DATALENGTH; i++, j++)
    {
	if (j <= 25)
	    plain[i] = (65 + j);
	else
	{
	    plain[i] = char('-');
	    plain[i + 1] = 65;
	    i++;
	    j = 0;
	}
    }

    emit = micros(); // time end

    Serial.print(F("Total takes:"));
    Serial.println(emit - time);

    if (beVerbose)
    {
	Serial.println(F("Printing array data:"));
	for (int i = 0; i < DATALENGTH; i++)
	    Serial.print(plain[i]);
	Serial.println();
    }
}

int main(void)
{
    init();
    setup();
    //    for (;;)
    loop();

    return 0; // must NEVER be reached
}

void setup()
{
    // Set up serial port for debugging
    Serial.begin(9600);

    while (!Serial)
    {
	; // wait for serial port to connect. Needed for Leonardo only
    }

    createDataArray();

    // initialize the digital pin as an output.
    // Pin 13 has an LED connected on most Arduino boards:
    pinMode(ledPin, OUTPUT);
}

void loop()
{
    Serial.print(F("freeMemory()="));
    Serial.println(freeRam());

    delete [] plain;

    Serial.print(F("freeMemory()="));
    Serial.println(freeRam());

    Serial.println(F("Light"));
    digitalWrite(ledPin, HIGH); // set the LED on
    delay(1000);

    Serial.println(F("Dark"));
    digitalWrite(ledPin, LOW); // set the LED off
    delay(1000);
}
