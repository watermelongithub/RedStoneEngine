#include <sdkddkver.h>
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <dxgi.h>
#include <d3d12.h>

DWORD WINAPI RenderThreadMain(LPVOID lpThreadParameter)
{
#if defined(_DEBUG)
	{
		ID3D12Debug *pD3d12Debug;
		if (SUCCEEDED(D3D12GetDebugInterface(IID_PPV_ARGS(&pD3d12Debug))))
		{
			pD3d12Debug->EnableDebugLayer();
		}
		pD3d12Debug->Release();
	}
#endif

	HWND hWnd = static_cast<HWND>(lpThreadParameter);
	return 0U;
}