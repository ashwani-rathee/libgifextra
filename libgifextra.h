#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <fcntl.h>
#include <gif_lib.h>

extern void LoadRGB(char *FileName, char *InFileName, int OneFileFlag, GifByteType **RedBuffer, GifByteType **GreenBuffer, GifByteType **BlueBuffer,int Width, int Height);
extern void GIF2RGB(int NumFiles, char *FileName, bool OneFileFlag, char *OutFileName);
extern void DumpScreen2RGB(char *FileName, int OneFileFlag, ColorMapObject *ColorMap, GifRowType *ScreenBuffer,int ScreenWidth, int ScreenHeight);
extern void RGB2GIF(bool OneFileFlag, int NumFiles, char *FileName, char *InFileName, int ExpNumOfColors, int Width, int Height);
extern void SaveGif(char *FileName, GifByteType *OutputBuffer, int Width, int Height, int ExpColorMapSize, ColorMapObject *OutputColorMap);
extern GifFileType* returnGIF(char *FileName);