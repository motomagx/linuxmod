#!/bin/sh
#
#Nano Encoder 0.1
#Designed for LinuxMod Flex 2.0
#By: João Guilherme (imagx)

if [ "$LX_ENV" != "true" ]
then
	. /ezxlocal/LinXtend/etc/initenv
fi

if [ ! -f /mmc/mmca1/.system/QTDownLoad/nanoencoder/ffmpeg/ffmpeg ]
then
	showMsg "Nano Encoder 0.1" "Erro: Nano Encoder não está instalado corretamente!" 2 1
	exit
fi

showRadio "Nano Encoder 0.1" "Selecione o local:" MicroSD Telefone
SELECT=$?

if [ $SELECT -eq 0 ]
then
	exit
fi
if [ $SELECT -eq 1 ]
then
	FILE1=/mmc/mmca1/
fi
if [ $SELECT -eq 2 ]
then
	FILE1=/ezxlocal/download/mystuff/
fi

FILE=`showFilePickerExt "Selecione o arquivo" "$FILE1"`



showRadio "Nano Encoder 0.1" "Selecione o formato:" MP3 WAV
SELECT=$?

if [ $SELECT -eq 0 ]
then
	exit
fi
if [ $SELECT -eq 1 ]
then
	TYPE=mp3
fi
if [ $SELECT -eq 2 ]
then
	TYPE=wav
fi


showRadio "Nano Encoder 0.1" "Selecione o bitrate:" 320 256 224 192 160 128 112 96 64 32
SELECT=$?

if [ $SELECT -eq 0 ]
then
	exit
fi
if [ $SELECT -eq 1 ]
then
	BITRATE=320
fi
if [ $SELECT -eq 2 ]
then
	BITRATE=256
fi
if [ $SELECT -eq 3 ]
then
	BITRATE=224
fi
if [ $SELECT -eq 4 ]
then
	BITRATE=192
fi
if [ $SELECT -eq 5 ]
then
	BITRATE=160
fi
if [ $SELECT -eq 6 ]
then
	BITRATE=128
fi
if [ $SELECT -eq 7 ]
then
	BITRATE=112
fi
if [ $SELECT -eq 8 ]
then
	BITRATE=96
fi
if [ $SELECT -eq 9 ]
then
	BITRATE=64
fi
if [ $SELECT -eq 10 ]
then
	BITRATE=32
fi



showRadio "Nano Encoder 0.1" "Selecione a frequência:" 48000 "44100 (padrão)" 22050 11025
SELECT=$?

if [ $SELECT -eq 0 ]
then
	exit
fi
if [ $SELECT -eq 1 ]
then
	FREQ=48000
fi
if [ $SELECT -eq 2 ]
then
	FREQ=44100
fi
if [ $SELECT -eq 3 ]
then
	FREQ=22050
fi
if [ $SELECT -eq 4 ]
then
	FREQ=11025
fi



showRadio "Nano Encoder 0.1" "Salvar arquivo em:" MicroSD Telefone
SELECT=$?

if [ $SELECT -eq 0 ]
then
	exit
fi
if [ $SELECT -eq 1 ]
then
	OUT=/mmc/mmca1
	OUT1=MicroSD
fi
if [ $SELECT -eq 2 ]
then
	OUT=/ezxlocal/download/mystuff
	OUT1=Telefone
fi

NAME=`showTextEntry 0 "Nano Encoder 0.1" "Salvar como:"`

showMsg "Nano Encoder 0.1" "Convertendo o arquivo. Você pode usar o sistema durante a
conversão." 2 1

/mmc/mmca1/.system/QTDownLoad/nanoencoder/ffmpeg/ffmpeg -i "$FILE" -vn -ar $FREQ -ac 2 -ab $BITRATE -f $TYPE "$OUT/$NAME.$TYPE"

showMsg "Nano Encoder 0.1" "Conversão concluida.
$NAME.$TYPE salvo em $OUT1." 2 1