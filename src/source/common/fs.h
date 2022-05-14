#include <nds.h>
#include "os.h"

#ifndef _FS_H
#define _FS_H

#define	FS_FILE_NAME_MAX	127

/*typedef u8 FSFile[512];*/

typedef enum
{
    FS_SEEK_SET,                       /* seek from begin */
    FS_SEEK_CUR,                       /* seek from current */
    FS_SEEK_END                        /* seek from end */
}
FSSeekFileMode;

enum {
	FS_ARCHIVE_NAME_LEN_MAX	= 3
} ;

typedef	enum
{
	FS_RESULT_SUCCESS = 0,
	FS_RESULT_FAILURE,
	FS_RESULT_BUSY,
	FS_RESULT_CANCELED,
	FS_RESULT_UNSUPPORTED,
	FS_RESULT_ERROR,
	FS_RESULT_PROC_ASYNC,
	FS_RESULT_PROC_DEFAULT,
	FS_RESULT_PROC_UNKNOWN

} FSResult;

typedef	struct
{
	struct	FSArchive	*arc;	/* attached archive */
	u16	own_id;	/* own directory id */
	u16	index;	/* if next FSDirEntry is file, its id */
	u32	pos;	/* seek offset to next FSDirEntry */
} FSDirPos;

typedef	struct
{
	struct	FSArchive	*arc;	/* attached archive */
	u32	file_id;	/* index of FAT of attached archive */
} FSFileID;

typedef	struct
{
	union {
		FSFileID	file_id;			/* valid if !is_directory */
		FSDirPos	dir_id;				/* valid if is_directory */
	} ;
	u32	is_directory;					/* directory ? 1 : 0 */
	u32	name_len;						/* strlen(name) */
	char	name[FS_FILE_NAME_MAX + 1];	/* string with '\0' */
} FSDirEntry;

typedef	struct
{
	FSDirPos	pos;
} FSSeekDirInfo;

typedef	struct
{
	FSDirEntry	*p_entry;
	BOOL	skip_string;
} FSReadDirInfo;

typedef	struct
{
	FSDirPos	pos;
	const char	*path;
	BOOL	find_directory;
	union {
		FSFileID	*file;
		FSDirPos	*dir;
	} result;
} FSFindPathInfo;

typedef	struct
{
	u8	*buf;
	u32	buf_len;
	u16	total_len;
	u16	dir_id;
} FSGetPathInfo;

typedef	struct
{
	FSFileID	id;
} FSOpenFileFastInfo;

typedef	struct
{
	u32	top;
	u32	bottom;
	u32	index;
} FSOpenFileDirectInfo;

typedef	struct
{
	u32	reserved;
} FSCloseFileInfo;

typedef	struct
{
	void	*dst;
	u32	len_org;
	u32	len;
} FSReadFileInfo;

typedef	struct
{
	const void	*src;
	u32	len_org;
	u32	len;
} FSWriteFileInfo;

/*typedef	struct	FSFileLink
{
	struct FSFile	*prev;
	struct FSFile	*next;
} FSFileLink;*/

typedef	struct	FSFile
{
	//FSFileLink	link;
	struct FSFile* linkprev;
	struct FSFile* linknext;
	struct	FSArchive	*arc;
	u32	stat;
	int	command;
	FSResult	error;
	OSThreadQueue	queue[4 / sizeof(OSThreadQueue)];
	union {
		struct	{
			u32	own_id;	/* own file-id */
			u32	top;	/* image-top */
			u32	bottom;	/* image-bottom */
			u32	pos;	/* current position */
		} file;
		struct {
			FSDirPos	pos;	/* current-directory-position */
			u32	parent;			/* parent directory-id */
		} dir;
	} prop;
	union {
		FSReadFileInfo			readfile;
		FSWriteFileInfo			writefile;

		FSSeekDirInfo			seekdir;
		FSReadDirInfo			readdir;
		FSFindPathInfo			findpath;
		FSGetPathInfo			getpath;
		FSOpenFileFastInfo		openfilefast;
		FSOpenFileDirectInfo	openfiledirect;
		FSCloseFileInfo			closefile;
	} arg;

} FSFile;

typedef	struct	FSFileLink
{
	FSFile* prev;
	FSFile* next;
} FSFileLink;

typedef	FSResult	(*FS_ARCHIVE_READ_FUNC)
	(struct FSArchive *p, void *dst, u32 pos, u32 size);

typedef	struct	FSArchive
{

	union {
		char ptr[FS_ARCHIVE_NAME_LEN_MAX + 1];
		u32	pack;
	} name;
	struct	FSArchive	*next;
	struct	FSArchive	*prev;
	OSThreadQueue	sync_q;	/* sync processing (SeekDir etc.) */
	OSThreadQueue	stat_q;	/* Change status (Suspend etc.) */
	u32	flag;	/* Internal status flag  (FS_ARCHIVE_FLAG_*) */

	FSFileLink	list;
	u32	base;		/* Base offset */
	u32	fat;		/* FAT offset */
	u32	fat_size;	/* FAT size */
	u32	fnt;		/* FNT offset */
	u32	fnt_size;	/* FNT size */
	u32	fat_bak;	/* FAT base offset before preload */
	u32	fnt_bak;	/* FNT base offset before preload */
	void	*load_mem;	/* Loaded table memory */
	FS_ARCHIVE_READ_FUNC	read_func;
	void*	write_func;
	void*	table_func;
	void*	proc;	
	u32	proc_flag;
} FSArchive;

#ifdef __cplusplus
extern "C"
{
#endif
	
	bool FS_CloseFile(void *p_file);
	static inline u32 FS_GetPosition(const FSFile *p_file);
	static inline BOOL FS_SeekFileToBegin(FSFile *p_file);
	void FS_InitFile(void *p_file);
	bool FS_OpenFile(void *p_file, const char *path);
	s32  FS_ReadFile(void *p_file, void *dst, s32 len);
	s32  FS_ReadFileAsync(void *p_file, void *dst, s32 len);
	bool FS_SeekFile(void *p_file, s32 offset, FSSeekFileMode origin);
	bool FS_WaitAsync(void *p_file);

	void FS_NotifyArchiveAsyncEnd(FSArchive *p_arc, FSResult ret);
	void FSi_OnRomReadDone(void *p_arc);

	static inline u32 FS_GetPosition(const FSFile *p_file)
	{
		return ((u32*)p_file)[0xB] - ((u32*)p_file)[9];
	}
	static inline BOOL FS_SeekFileToBegin(FSFile *p_file)
	{
		return FS_SeekFile(p_file, 0, FS_SEEK_SET);
	}
	
#ifdef __cplusplus
}
#endif

#endif