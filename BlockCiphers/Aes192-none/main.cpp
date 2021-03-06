/* 
 * File:   main.cpp
 * Author: Tomas Frtala
 *
 * Created on Streda, 2014, apríl 16, 16:03
 */

#include <Arduino.h>
#include "EEPROM.h"
#include "src/aes/aes.h"

// variables
#define KEYLENGTH 24
#define N_ROW                   4
#define N_COL                   4
#define N_BLOCK   (N_ROW * N_COL)
#define DATALENGTH 1024

extern HardwareSerial Serial;

//variables
//boolean beVerbose = false; // verbose some steps

// AES declarations
aes192_ctx_t key_init;
byte key[KEYLENGTH]; //key

// Data variables
byte* plain = new byte[DATALENGTH]; // 1 kB (1024 bytov) z max. 2 kB SRAM
byte* pPlain = plain;

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
    Serial.println(F("Creating array of data"));

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

    //    emit = micros(); // time end
    //
    //    Serial.print(F("Total takes: "));
    //    Serial.print(emit - time);
    //    Serial.println(F(" [us]"));
    //
    //    if (beVerbose)
    //    {
    //	Serial.println(F("Printing array data:"));
    //	for (int i = 0; i < DATALENGTH; i++)
    //	    Serial.print(plain[i]);
    //	Serial.println();
    //    }
}

int main(void)
{
    init();
    setup();
    //    for (;;)
    loop();

    return 0; // must NEVER be reached
}

void readKey(int length)
{
    //    if (beVerbose)
    //	Serial.println(F("Generating key"));

    for (int i = 0; i < length; i++)
    {
	key[i] = EEPROM.read(i);

	//	if (beVerbose)
	//	{
	//	    Serial.print(i);
	//	    Serial.print(F("\t"));
	//	    Serial.print(key[i], DEC);
	//	    Serial.println();
	//	}
    }
}

void getBlockOfMsg(byte* pointer, byte* plain)
{
    for (unsigned int i = 0; i < N_BLOCK; i++, pointer++)
    {
	plain[i] = *pointer;

	//	if (beVerbose)
	//	{
	//	    Serial.print(F("cipher["));
	//	    Serial.print(i);
	//	    Serial.print(F("]:"));
	//
	//	    Serial.print(F("\t"));
	//	    Serial.print(cipher[i]); // note
	//
	//	    Serial.print(F("\t"));
	//	    Serial.print(F("char(plain(["));
	//	    Serial.print(i);
	//	    Serial.print(F("]:"));
	//
	//	    Serial.print(F("\t"));
	//	    Serial.print(char(cipher[i])); // note
	//
	//	    Serial.println();
	//	}
    }
}

void setup()
{
    // Set up serial port for debugging
    Serial.begin(9600);

    while (!Serial)
    {
	; // wait for serial port to connect. Needed for Leonardo only
    }

    // Fullfil the data array
    createDataArray();

    // Read and set the key from the EEPROM
    readKey(KEYLENGTH);

    // Inicialization of the key
    time = micros(); // time start
    aes192_init(key, &key_init);
    emit = micros(); // time start

    Serial.print(F("Inicialisation total takes: "));
    Serial.print(emit - time);
    Serial.println(F(" [us]"));

    // initialize the digital pin as an output.
    // Pin 13 has an LED connected on most Arduino boards:
    pinMode(ledPin, OUTPUT);
}

void loop()
{
    Serial.print(F("Before encryption of message freeMemory()= "));
    Serial.print(freeRam());
    Serial.println(F(" [byte]"));

    time = micros(); // time start
    // ------------------------------------------
        for (int piece = 0; piece < N_BLOCK; piece += N_BLOCK, pPlain += N_BLOCK)
//    for (int piece = 0; piece < DATALENGTH; piece += N_BLOCK, pPlain += N_BLOCK)
    {
	// Divide message into a block of 128 bit = 16 byte
	byte cipher[N_BLOCK];
	getBlockOfMsg(pPlain, cipher);

	//	if (beVerbose)
	//	{
	//	    Serial.println();
	//	    Serial.println("OT:");
	//	    for (unsigned int i = 0; i < N_BLOCK; i++)
	//		Serial.print(char(cipher[i]));
	//	}

	//	time = micros(); // time start
	aes192_enc(cipher, &key_init); // Encrypt message
	//	emit = micros(); // time end

	//	Serial.print(F("Encryption total takes: "));
	//	Serial.print(emit - time);
	//	Serial.println(F(" [us]"));

	//	if (beVerbose)
	//	{
	//	    Serial.println();
	//	    Serial.println("CT:");
	//	    for (int i = 0; i < N_BLOCK; i++)
	//		Serial.print(cipher[i]);
	//	}

	//	delete [] cipher; // do not forget to free ram
    }
    // ------------------------------------------
    emit = micros(); // time start

    Serial.print(F("After encryption of message freeMemory()= "));
    Serial.print(freeRam());
    Serial.println(F(" [byte]"));

    Serial.print(F("Encryption total takes: "));
    Serial.print(emit - time);
    Serial.println(F(" [ms]"));

    Serial.println();

    Serial.println(F("Light"));
    digitalWrite(ledPin, HIGH); // set the LED on
    delay(1000);

    Serial.println(F("Dark"));
    digitalWrite(ledPin, LOW); // set the LED off
    delay(1000);
}
