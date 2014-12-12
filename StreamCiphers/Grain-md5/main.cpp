/* 
 * File:   main.cpp
 * Author: Tomas Frtala
 *
 * Created on Streda, 2014, apríl 16, 16:03
 */

#include <Arduino.h>
#include "EEPROM.h"
#include "src/grain/grain.h"
#include "src/hmac/hmac-md5/hmac-md5.h"

// variables
#define KEYLENGTH 10
#define IVLENGTH 8
#define DATALENGTH 1024

extern HardwareSerial Serial;

//variables
//boolean beVerbose = true; // verbose some steps

grain_ctx_t reg;
//grain_ctx_t reg2;

// Present declarations
byte key[KEYLENGTH]; //key
byte vectorIV[IVLENGTH];

// Data variables
byte* plain = new byte[DATALENGTH]; // 1 kB (1024 bytov) z max. 2 kB SRAM
//byte* pPlain = plain;

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

void readIV(int length)
{
    //    if (beVerbose)
    //	Serial.println(F("Generating IV"));

    for (int i = 0; i < length; i++)
    {
	vectorIV[i] = rand() + micros();

	//	if (beVerbose)
	//	{
	//	    Serial.print("i:");
	//	    Serial.print(i);
	//	    Serial.print("\t");
	//	    //	    Serial.print(key[i], DEC);
	//	    Serial.print("k:");
	//	    Serial.print(vectorIV[i]);
	//	    Serial.print("\t");
	//	}
    }

    //    if (beVerbose)
    //	Serial.println();
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

    // Inicialize the vector
    readIV(IVLENGTH);

    // Inicializate the cipher
    time = micros(); // time start
    grain_init(key, vectorIV, &reg); // enc
    //    grain_init(key, vectorIV, &reg2); // dec
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
    //    Serial.println(F("CT:"));
        for (int piece = 0; piece < DATALENGTH; piece++)
//    for (int piece = 0; piece < 1; piece++)
    {
	// Divide message into a block of 128 bit = 16 byte
	//	byte* cipher = getBlockOfMsg(pPlain);
	//	byte vysledok = grain_getbyte(&reg);

	//	if (beVerbose)
	//	{
	//	    Serial.println();
	//	    Serial.println("OT:");
	//	    for (unsigned int i = 0; i < N_BLOCK; i++)
	//		Serial.print(char(cipher[i]));
	//	}

	//	time = micros(); // time start
	//	present128_enc(cipher, &key_init);

	plain[piece] ^= grain_getbyte(&reg);

	//	cipher[offset] = plainSent[offset]^vysledok;

	//	emit = micros(); // time end

	//	Serial.print(F("Encryption total takes: "));
	//	Serial.print(emit - time);
	//	Serial.println(F(" [us]"));
	//		if (beVerbose)
	//		{
	//		    Serial.println();
	//		    Serial.println("CT:");
	//		    for (int i = 0; i < N_BLOCK; i++)
	//			Serial.print(plain[piece]);
	//		}

	//	delete [] cipher; // do not forget to free ram
    }

    byte hash[16];
    //    void hmac_md5(void* dest, void* key, uint16_t keylength_b, void* msg, uint32_t msglength_b){ /* a one-shot*/
//    hmac_md5(hash, key, 80, plain, 8);
    hmac_md5(hash, key, 80, plain, 8192);
//    hmac_md5(hash, key, 80, plain, 8192);
    // ------------------------------------------
    emit = micros(); // time start

    Serial.print(F("After encryption of message freeMemory()= "));
    Serial.print(freeRam());
    Serial.println(F(" [byte]"));

    Serial.print(F("Encryption total takes: "));
    Serial.print(emit - time);
    Serial.println(F(" [us]"));

    //    Serial.println();
    //    Serial.println(F("OT:"));
    //    for (int piece = 0; piece < DATALENGTH; piece++)
    //    {
    //	plain[piece] ^= grain_getbyte(&reg2);
    //	Serial.print(char(plain[piece]));
    //    }
    Serial.println();

    Serial.println(F("Light"));
    digitalWrite(ledPin, HIGH); // set the LED on
    delay(1000);

    Serial.println(F("Dark"));
    digitalWrite(ledPin, LOW); // set the LED off
    delay(1000);
}
