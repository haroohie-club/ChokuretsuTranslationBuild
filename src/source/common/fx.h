#include <nds.h>

#ifndef __FX_H__
#define __FX_H__

#ifdef __cplusplus
extern "C"
{
#endif
	#define FX64C_65536_360                  ((fx64c) 0x000000b60b60b60bLL)    // 182.044444444 
	#define FX_DEG_TO_IDX(deg)            ((u16) ((FX64C_65536_360 * (deg) + 0x80000000000LL) >> 44))

	extern fx16 FX_SinCosTable_[];

	static inline fx16 FX_SinIdx(int idx)
	{
		return FX_SinCosTable_[((idx >> 4) << 1)];
	}
	
	static inline fx16 FX_CosIdx(int idx)
	{
		return FX_SinCosTable_[((idx >> 4) << 1) + 1];
	}
	
#ifdef __cplusplus
}
#endif

#endif