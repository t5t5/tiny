#include <windows.h>

int run();

#if defined(TOOLCHAIN_MSVC)
int WINAPI WinMainCRTStartup()
{
	return run();
}
#endif

#if defined(TOOLCHAIN_GCC)
int WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
	return run();
}
#endif

int run()
{
  MessageBoxA(0, "Hello", "world!", MB_OK);
  ExitProcess(0);
  return 0;
}
