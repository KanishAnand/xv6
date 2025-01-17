
_pinfo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
#include "procstat.h"
int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 40             	sub    $0x40,%esp
  11:	8b 41 04             	mov    0x4(%ecx),%eax
    int n;

    n = atoi(argv[1]);
  14:	ff 70 04             	pushl  0x4(%eax)
  17:	e8 64 02 00 00       	call   280 <atoi>
    // printf(1, "%d\n", n);
    struct proc_stat s1;

    getpinfo(&s1, n);
  1c:	5a                   	pop    %edx
  1d:	59                   	pop    %ecx
  1e:	50                   	push   %eax
  1f:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  22:	50                   	push   %eax
  23:	e8 7a 03 00 00       	call   3a2 <getpinfo>
    printf(1, "pid : %d\n", s1.pid);
  28:	83 c4 0c             	add    $0xc,%esp
  2b:	ff 75 d4             	pushl  -0x2c(%ebp)
  2e:	68 a8 07 00 00       	push   $0x7a8
  33:	6a 01                	push   $0x1
  35:	e8 16 04 00 00       	call   450 <printf>
    printf(1, "current queue : %d\n", s1.current_queue);
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	ff 75 e0             	pushl  -0x20(%ebp)
  40:	68 b2 07 00 00       	push   $0x7b2
  45:	6a 01                	push   $0x1
  47:	e8 04 04 00 00       	call   450 <printf>
    printf(1, "num_run : %d\n", s1.num_run);
  4c:	83 c4 0c             	add    $0xc,%esp
  4f:	ff 75 dc             	pushl  -0x24(%ebp)
  52:	68 c6 07 00 00       	push   $0x7c6
  57:	6a 01                	push   $0x1
  59:	e8 f2 03 00 00       	call   450 <printf>
    printf(1, "runtime : %d\n", s1.runtime);
  5e:	83 c4 0c             	add    $0xc,%esp
  61:	ff 75 d8             	pushl  -0x28(%ebp)
  64:	68 d4 07 00 00       	push   $0x7d4
  69:	6a 01                	push   $0x1
  6b:	e8 e0 03 00 00       	call   450 <printf>
    printf(1, "ticks : %d %d %d %d %d\n", s1.ticks[0], s1.ticks[1], s1.ticks[2],
  70:	83 c4 0c             	add    $0xc,%esp
  73:	ff 75 f4             	pushl  -0xc(%ebp)
  76:	ff 75 f0             	pushl  -0x10(%ebp)
  79:	ff 75 ec             	pushl  -0x14(%ebp)
  7c:	ff 75 e8             	pushl  -0x18(%ebp)
  7f:	ff 75 e4             	pushl  -0x1c(%ebp)
  82:	68 e2 07 00 00       	push   $0x7e2
  87:	6a 01                	push   $0x1
  89:	e8 c2 03 00 00       	call   450 <printf>
           s1.ticks[3], s1.ticks[4]);
  8e:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  91:	31 c0                	xor    %eax,%eax
  93:	c9                   	leave  
  94:	8d 61 fc             	lea    -0x4(%ecx),%esp
  97:	c3                   	ret    
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  aa:	89 c2                	mov    %eax,%edx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	83 c1 01             	add    $0x1,%ecx
  b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	84 db                	test   %bl,%bl
  bc:	88 5a ff             	mov    %bl,-0x1(%edx)
  bf:	75 ef                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  c1:	5b                   	pop    %ebx
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    
  c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
  d4:	8b 55 08             	mov    0x8(%ebp),%edx
  d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  da:	0f b6 02             	movzbl (%edx),%eax
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	84 c0                	test   %al,%al
  e2:	75 1c                	jne    100 <strcmp+0x30>
  e4:	eb 2a                	jmp    110 <strcmp+0x40>
  e6:	8d 76 00             	lea    0x0(%esi),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  f0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  f6:	83 c1 01             	add    $0x1,%ecx
  f9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
  fc:	84 c0                	test   %al,%al
  fe:	74 10                	je     110 <strcmp+0x40>
 100:	38 d8                	cmp    %bl,%al
 102:	74 ec                	je     f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 104:	29 d8                	sub    %ebx,%eax
}
 106:	5b                   	pop    %ebx
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 110:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 112:	29 d8                	sub    %ebx,%eax
}
 114:	5b                   	pop    %ebx
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	89 f6                	mov    %esi,%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000120 <strlen>:

uint
strlen(const char *s)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 126:	80 39 00             	cmpb   $0x0,(%ecx)
 129:	74 15                	je     140 <strlen+0x20>
 12b:	31 d2                	xor    %edx,%edx
 12d:	8d 76 00             	lea    0x0(%esi),%esi
 130:	83 c2 01             	add    $0x1,%edx
 133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 137:	89 d0                	mov    %edx,%eax
 139:	75 f5                	jne    130 <strlen+0x10>
    ;
  return n;
}
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 140:	31 c0                	xor    %eax,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 14a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000150 <memset>:

void*
memset(void *dst, int c, uint n)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 157:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	89 d7                	mov    %edx,%edi
 15f:	fc                   	cld    
 160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 162:	89 d0                	mov    %edx,%eax
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 17a:	0f b6 10             	movzbl (%eax),%edx
 17d:	84 d2                	test   %dl,%dl
 17f:	74 1d                	je     19e <strchr+0x2e>
    if(*s == c)
 181:	38 d3                	cmp    %dl,%bl
 183:	89 d9                	mov    %ebx,%ecx
 185:	75 0d                	jne    194 <strchr+0x24>
 187:	eb 17                	jmp    1a0 <strchr+0x30>
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	38 ca                	cmp    %cl,%dl
 192:	74 0c                	je     1a0 <strchr+0x30>
  for(; *s; s++)
 194:	83 c0 01             	add    $0x1,%eax
 197:	0f b6 10             	movzbl (%eax),%edx
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strchr+0x20>
      return (char*)s;
  return 0;
 19e:	31 c0                	xor    %eax,%eax
}
 1a0:	5b                   	pop    %ebx
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    
 1a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <gets>:

char*
gets(char *buf, int max)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b6:	31 f6                	xor    %esi,%esi
 1b8:	89 f3                	mov    %esi,%ebx
{
 1ba:	83 ec 1c             	sub    $0x1c,%esp
 1bd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1c0:	eb 2f                	jmp    1f1 <gets+0x41>
 1c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1cb:	83 ec 04             	sub    $0x4,%esp
 1ce:	6a 01                	push   $0x1
 1d0:	50                   	push   %eax
 1d1:	6a 00                	push   $0x0
 1d3:	e8 32 01 00 00       	call   30a <read>
    if(cc < 1)
 1d8:	83 c4 10             	add    $0x10,%esp
 1db:	85 c0                	test   %eax,%eax
 1dd:	7e 1c                	jle    1fb <gets+0x4b>
      break;
    buf[i++] = c;
 1df:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1e3:	83 c7 01             	add    $0x1,%edi
 1e6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1e9:	3c 0a                	cmp    $0xa,%al
 1eb:	74 23                	je     210 <gets+0x60>
 1ed:	3c 0d                	cmp    $0xd,%al
 1ef:	74 1f                	je     210 <gets+0x60>
  for(i=0; i+1 < max; ){
 1f1:	83 c3 01             	add    $0x1,%ebx
 1f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f7:	89 fe                	mov    %edi,%esi
 1f9:	7c cd                	jl     1c8 <gets+0x18>
 1fb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 200:	c6 03 00             	movb   $0x0,(%ebx)
}
 203:	8d 65 f4             	lea    -0xc(%ebp),%esp
 206:	5b                   	pop    %ebx
 207:	5e                   	pop    %esi
 208:	5f                   	pop    %edi
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    
 20b:	90                   	nop
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 210:	8b 75 08             	mov    0x8(%ebp),%esi
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	01 de                	add    %ebx,%esi
 218:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 21a:	c6 03 00             	movb   $0x0,(%ebx)
}
 21d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 220:	5b                   	pop    %ebx
 221:	5e                   	pop    %esi
 222:	5f                   	pop    %edi
 223:	5d                   	pop    %ebp
 224:	c3                   	ret    
 225:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <stat>:

int
stat(const char *n, struct stat *st)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	56                   	push   %esi
 234:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 235:	83 ec 08             	sub    $0x8,%esp
 238:	6a 00                	push   $0x0
 23a:	ff 75 08             	pushl  0x8(%ebp)
 23d:	e8 f0 00 00 00       	call   332 <open>
  if(fd < 0)
 242:	83 c4 10             	add    $0x10,%esp
 245:	85 c0                	test   %eax,%eax
 247:	78 27                	js     270 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 249:	83 ec 08             	sub    $0x8,%esp
 24c:	ff 75 0c             	pushl  0xc(%ebp)
 24f:	89 c3                	mov    %eax,%ebx
 251:	50                   	push   %eax
 252:	e8 f3 00 00 00       	call   34a <fstat>
  close(fd);
 257:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 25a:	89 c6                	mov    %eax,%esi
  close(fd);
 25c:	e8 b9 00 00 00       	call   31a <close>
  return r;
 261:	83 c4 10             	add    $0x10,%esp
}
 264:	8d 65 f8             	lea    -0x8(%ebp),%esp
 267:	89 f0                	mov    %esi,%eax
 269:	5b                   	pop    %ebx
 26a:	5e                   	pop    %esi
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
 26d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 270:	be ff ff ff ff       	mov    $0xffffffff,%esi
 275:	eb ed                	jmp    264 <stat+0x34>
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <atoi>:

int
atoi(const char *s)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 287:	0f be 11             	movsbl (%ecx),%edx
 28a:	8d 42 d0             	lea    -0x30(%edx),%eax
 28d:	3c 09                	cmp    $0x9,%al
  n = 0;
 28f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 294:	77 1f                	ja     2b5 <atoi+0x35>
 296:	8d 76 00             	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2a0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2a3:	83 c1 01             	add    $0x1,%ecx
 2a6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2aa:	0f be 11             	movsbl (%ecx),%edx
 2ad:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2b0:	80 fb 09             	cmp    $0x9,%bl
 2b3:	76 eb                	jbe    2a0 <atoi+0x20>
  return n;
}
 2b5:	5b                   	pop    %ebx
 2b6:	5d                   	pop    %ebp
 2b7:	c3                   	ret    
 2b8:	90                   	nop
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	56                   	push   %esi
 2c4:	53                   	push   %ebx
 2c5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2c8:	8b 45 08             	mov    0x8(%ebp),%eax
 2cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ce:	85 db                	test   %ebx,%ebx
 2d0:	7e 14                	jle    2e6 <memmove+0x26>
 2d2:	31 d2                	xor    %edx,%edx
 2d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2df:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 2e2:	39 d3                	cmp    %edx,%ebx
 2e4:	75 f2                	jne    2d8 <memmove+0x18>
  return vdst;
}
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5d                   	pop    %ebp
 2e9:	c3                   	ret    

000002ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ea:	b8 01 00 00 00       	mov    $0x1,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <exit>:
SYSCALL(exit)
 2f2:	b8 02 00 00 00       	mov    $0x2,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <wait>:
SYSCALL(wait)
 2fa:	b8 03 00 00 00       	mov    $0x3,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <pipe>:
SYSCALL(pipe)
 302:	b8 04 00 00 00       	mov    $0x4,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <read>:
SYSCALL(read)
 30a:	b8 05 00 00 00       	mov    $0x5,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <write>:
SYSCALL(write)
 312:	b8 10 00 00 00       	mov    $0x10,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <close>:
SYSCALL(close)
 31a:	b8 15 00 00 00       	mov    $0x15,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <kill>:
SYSCALL(kill)
 322:	b8 06 00 00 00       	mov    $0x6,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <exec>:
SYSCALL(exec)
 32a:	b8 07 00 00 00       	mov    $0x7,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <open>:
SYSCALL(open)
 332:	b8 0f 00 00 00       	mov    $0xf,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <mknod>:
SYSCALL(mknod)
 33a:	b8 11 00 00 00       	mov    $0x11,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <unlink>:
SYSCALL(unlink)
 342:	b8 12 00 00 00       	mov    $0x12,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <fstat>:
SYSCALL(fstat)
 34a:	b8 08 00 00 00       	mov    $0x8,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <link>:
SYSCALL(link)
 352:	b8 13 00 00 00       	mov    $0x13,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <mkdir>:
SYSCALL(mkdir)
 35a:	b8 14 00 00 00       	mov    $0x14,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <chdir>:
SYSCALL(chdir)
 362:	b8 09 00 00 00       	mov    $0x9,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <dup>:
SYSCALL(dup)
 36a:	b8 0a 00 00 00       	mov    $0xa,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <getpid>:
SYSCALL(getpid)
 372:	b8 0b 00 00 00       	mov    $0xb,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <sbrk>:
SYSCALL(sbrk)
 37a:	b8 0c 00 00 00       	mov    $0xc,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <sleep>:
SYSCALL(sleep)
 382:	b8 0d 00 00 00       	mov    $0xd,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <uptime>:
SYSCALL(uptime)
 38a:	b8 0e 00 00 00       	mov    $0xe,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <waitx>:
SYSCALL(waitx)
 392:	b8 16 00 00 00       	mov    $0x16,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <set_priority>:
SYSCALL(set_priority)
 39a:	b8 17 00 00 00       	mov    $0x17,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <getpinfo>:
SYSCALL(getpinfo)
 3a2:	b8 18 00 00 00       	mov    $0x18,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    
 3aa:	66 90                	xchg   %ax,%ax
 3ac:	66 90                	xchg   %ax,%ax
 3ae:	66 90                	xchg   %ax,%ax

000003b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
 3b5:	53                   	push   %ebx
 3b6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3b9:	85 d2                	test   %edx,%edx
{
 3bb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 3be:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 3c0:	79 76                	jns    438 <printint+0x88>
 3c2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3c6:	74 70                	je     438 <printint+0x88>
    x = -xx;
 3c8:	f7 d8                	neg    %eax
    neg = 1;
 3ca:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3d1:	31 f6                	xor    %esi,%esi
 3d3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3d6:	eb 0a                	jmp    3e2 <printint+0x32>
 3d8:	90                   	nop
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 3e0:	89 fe                	mov    %edi,%esi
 3e2:	31 d2                	xor    %edx,%edx
 3e4:	8d 7e 01             	lea    0x1(%esi),%edi
 3e7:	f7 f1                	div    %ecx
 3e9:	0f b6 92 04 08 00 00 	movzbl 0x804(%edx),%edx
  }while((x /= base) != 0);
 3f0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3f2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 3f5:	75 e9                	jne    3e0 <printint+0x30>
  if(neg)
 3f7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3fa:	85 c0                	test   %eax,%eax
 3fc:	74 08                	je     406 <printint+0x56>
    buf[i++] = '-';
 3fe:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 403:	8d 7e 02             	lea    0x2(%esi),%edi
 406:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 40a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
 410:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 413:	83 ec 04             	sub    $0x4,%esp
 416:	83 ee 01             	sub    $0x1,%esi
 419:	6a 01                	push   $0x1
 41b:	53                   	push   %ebx
 41c:	57                   	push   %edi
 41d:	88 45 d7             	mov    %al,-0x29(%ebp)
 420:	e8 ed fe ff ff       	call   312 <write>

  while(--i >= 0)
 425:	83 c4 10             	add    $0x10,%esp
 428:	39 de                	cmp    %ebx,%esi
 42a:	75 e4                	jne    410 <printint+0x60>
    putc(fd, buf[i]);
}
 42c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42f:	5b                   	pop    %ebx
 430:	5e                   	pop    %esi
 431:	5f                   	pop    %edi
 432:	5d                   	pop    %ebp
 433:	c3                   	ret    
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 438:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 43f:	eb 90                	jmp    3d1 <printint+0x21>
 441:	eb 0d                	jmp    450 <printf>
 443:	90                   	nop
 444:	90                   	nop
 445:	90                   	nop
 446:	90                   	nop
 447:	90                   	nop
 448:	90                   	nop
 449:	90                   	nop
 44a:	90                   	nop
 44b:	90                   	nop
 44c:	90                   	nop
 44d:	90                   	nop
 44e:	90                   	nop
 44f:	90                   	nop

00000450 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 459:	8b 75 0c             	mov    0xc(%ebp),%esi
 45c:	0f b6 1e             	movzbl (%esi),%ebx
 45f:	84 db                	test   %bl,%bl
 461:	0f 84 b3 00 00 00    	je     51a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 467:	8d 45 10             	lea    0x10(%ebp),%eax
 46a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 46d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 46f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 472:	eb 2f                	jmp    4a3 <printf+0x53>
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 478:	83 f8 25             	cmp    $0x25,%eax
 47b:	0f 84 a7 00 00 00    	je     528 <printf+0xd8>
  write(fd, &c, 1);
 481:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 484:	83 ec 04             	sub    $0x4,%esp
 487:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 48a:	6a 01                	push   $0x1
 48c:	50                   	push   %eax
 48d:	ff 75 08             	pushl  0x8(%ebp)
 490:	e8 7d fe ff ff       	call   312 <write>
 495:	83 c4 10             	add    $0x10,%esp
 498:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 49b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 49f:	84 db                	test   %bl,%bl
 4a1:	74 77                	je     51a <printf+0xca>
    if(state == 0){
 4a3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 4a5:	0f be cb             	movsbl %bl,%ecx
 4a8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4ab:	74 cb                	je     478 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4ad:	83 ff 25             	cmp    $0x25,%edi
 4b0:	75 e6                	jne    498 <printf+0x48>
      if(c == 'd'){
 4b2:	83 f8 64             	cmp    $0x64,%eax
 4b5:	0f 84 05 01 00 00    	je     5c0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4bb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4c1:	83 f9 70             	cmp    $0x70,%ecx
 4c4:	74 72                	je     538 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4c6:	83 f8 73             	cmp    $0x73,%eax
 4c9:	0f 84 99 00 00 00    	je     568 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4cf:	83 f8 63             	cmp    $0x63,%eax
 4d2:	0f 84 08 01 00 00    	je     5e0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	0f 84 ef 00 00 00    	je     5d0 <printf+0x180>
  write(fd, &c, 1);
 4e1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4e4:	83 ec 04             	sub    $0x4,%esp
 4e7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4eb:	6a 01                	push   $0x1
 4ed:	50                   	push   %eax
 4ee:	ff 75 08             	pushl  0x8(%ebp)
 4f1:	e8 1c fe ff ff       	call   312 <write>
 4f6:	83 c4 0c             	add    $0xc,%esp
 4f9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4fc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4ff:	6a 01                	push   $0x1
 501:	50                   	push   %eax
 502:	ff 75 08             	pushl  0x8(%ebp)
 505:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 508:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 50a:	e8 03 fe ff ff       	call   312 <write>
  for(i = 0; fmt[i]; i++){
 50f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 513:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 516:	84 db                	test   %bl,%bl
 518:	75 89                	jne    4a3 <printf+0x53>
    }
  }
}
 51a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51d:	5b                   	pop    %ebx
 51e:	5e                   	pop    %esi
 51f:	5f                   	pop    %edi
 520:	5d                   	pop    %ebp
 521:	c3                   	ret    
 522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 528:	bf 25 00 00 00       	mov    $0x25,%edi
 52d:	e9 66 ff ff ff       	jmp    498 <printf+0x48>
 532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 538:	83 ec 0c             	sub    $0xc,%esp
 53b:	b9 10 00 00 00       	mov    $0x10,%ecx
 540:	6a 00                	push   $0x0
 542:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 545:	8b 45 08             	mov    0x8(%ebp),%eax
 548:	8b 17                	mov    (%edi),%edx
 54a:	e8 61 fe ff ff       	call   3b0 <printint>
        ap++;
 54f:	89 f8                	mov    %edi,%eax
 551:	83 c4 10             	add    $0x10,%esp
      state = 0;
 554:	31 ff                	xor    %edi,%edi
        ap++;
 556:	83 c0 04             	add    $0x4,%eax
 559:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 55c:	e9 37 ff ff ff       	jmp    498 <printf+0x48>
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 568:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 56b:	8b 08                	mov    (%eax),%ecx
        ap++;
 56d:	83 c0 04             	add    $0x4,%eax
 570:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 573:	85 c9                	test   %ecx,%ecx
 575:	0f 84 8e 00 00 00    	je     609 <printf+0x1b9>
        while(*s != 0){
 57b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 57e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 580:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 582:	84 c0                	test   %al,%al
 584:	0f 84 0e ff ff ff    	je     498 <printf+0x48>
 58a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 58d:	89 de                	mov    %ebx,%esi
 58f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 592:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 595:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 598:	83 ec 04             	sub    $0x4,%esp
          s++;
 59b:	83 c6 01             	add    $0x1,%esi
 59e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5a1:	6a 01                	push   $0x1
 5a3:	57                   	push   %edi
 5a4:	53                   	push   %ebx
 5a5:	e8 68 fd ff ff       	call   312 <write>
        while(*s != 0){
 5aa:	0f b6 06             	movzbl (%esi),%eax
 5ad:	83 c4 10             	add    $0x10,%esp
 5b0:	84 c0                	test   %al,%al
 5b2:	75 e4                	jne    598 <printf+0x148>
 5b4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 5b7:	31 ff                	xor    %edi,%edi
 5b9:	e9 da fe ff ff       	jmp    498 <printf+0x48>
 5be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 5c0:	83 ec 0c             	sub    $0xc,%esp
 5c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5c8:	6a 01                	push   $0x1
 5ca:	e9 73 ff ff ff       	jmp    542 <printf+0xf2>
 5cf:	90                   	nop
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5d9:	6a 01                	push   $0x1
 5db:	e9 21 ff ff ff       	jmp    501 <printf+0xb1>
        putc(fd, *ap);
 5e0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 5e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5e6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 5e8:	6a 01                	push   $0x1
        ap++;
 5ea:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 5ed:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 5f0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5f3:	50                   	push   %eax
 5f4:	ff 75 08             	pushl  0x8(%ebp)
 5f7:	e8 16 fd ff ff       	call   312 <write>
        ap++;
 5fc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 5ff:	83 c4 10             	add    $0x10,%esp
      state = 0;
 602:	31 ff                	xor    %edi,%edi
 604:	e9 8f fe ff ff       	jmp    498 <printf+0x48>
          s = "(null)";
 609:	bb fa 07 00 00       	mov    $0x7fa,%ebx
        while(*s != 0){
 60e:	b8 28 00 00 00       	mov    $0x28,%eax
 613:	e9 72 ff ff ff       	jmp    58a <printf+0x13a>
 618:	66 90                	xchg   %ax,%ax
 61a:	66 90                	xchg   %ax,%ax
 61c:	66 90                	xchg   %ax,%ax
 61e:	66 90                	xchg   %ax,%ax

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	a1 c0 0a 00 00       	mov    0xac0,%eax
{
 626:	89 e5                	mov    %esp,%ebp
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	53                   	push   %ebx
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 62e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 638:	39 c8                	cmp    %ecx,%eax
 63a:	8b 10                	mov    (%eax),%edx
 63c:	73 32                	jae    670 <free+0x50>
 63e:	39 d1                	cmp    %edx,%ecx
 640:	72 04                	jb     646 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 642:	39 d0                	cmp    %edx,%eax
 644:	72 32                	jb     678 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 646:	8b 73 fc             	mov    -0x4(%ebx),%esi
 649:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 64c:	39 fa                	cmp    %edi,%edx
 64e:	74 30                	je     680 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 650:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 653:	8b 50 04             	mov    0x4(%eax),%edx
 656:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 659:	39 f1                	cmp    %esi,%ecx
 65b:	74 3a                	je     697 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 65d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 65f:	a3 c0 0a 00 00       	mov    %eax,0xac0
}
 664:	5b                   	pop    %ebx
 665:	5e                   	pop    %esi
 666:	5f                   	pop    %edi
 667:	5d                   	pop    %ebp
 668:	c3                   	ret    
 669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 670:	39 d0                	cmp    %edx,%eax
 672:	72 04                	jb     678 <free+0x58>
 674:	39 d1                	cmp    %edx,%ecx
 676:	72 ce                	jb     646 <free+0x26>
{
 678:	89 d0                	mov    %edx,%eax
 67a:	eb bc                	jmp    638 <free+0x18>
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 680:	03 72 04             	add    0x4(%edx),%esi
 683:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 686:	8b 10                	mov    (%eax),%edx
 688:	8b 12                	mov    (%edx),%edx
 68a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 68d:	8b 50 04             	mov    0x4(%eax),%edx
 690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 693:	39 f1                	cmp    %esi,%ecx
 695:	75 c6                	jne    65d <free+0x3d>
    p->s.size += bp->s.size;
 697:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 69a:	a3 c0 0a 00 00       	mov    %eax,0xac0
    p->s.size += bp->s.size;
 69f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a5:	89 10                	mov    %edx,(%eax)
}
 6a7:	5b                   	pop    %ebx
 6a8:	5e                   	pop    %esi
 6a9:	5f                   	pop    %edi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret    
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6bc:	8b 15 c0 0a 00 00    	mov    0xac0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c2:	8d 78 07             	lea    0x7(%eax),%edi
 6c5:	c1 ef 03             	shr    $0x3,%edi
 6c8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6cb:	85 d2                	test   %edx,%edx
 6cd:	0f 84 9d 00 00 00    	je     770 <malloc+0xc0>
 6d3:	8b 02                	mov    (%edx),%eax
 6d5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6d8:	39 cf                	cmp    %ecx,%edi
 6da:	76 6c                	jbe    748 <malloc+0x98>
 6dc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6e2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6e7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6ea:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6f1:	eb 0e                	jmp    701 <malloc+0x51>
 6f3:	90                   	nop
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6fa:	8b 48 04             	mov    0x4(%eax),%ecx
 6fd:	39 f9                	cmp    %edi,%ecx
 6ff:	73 47                	jae    748 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 701:	39 05 c0 0a 00 00    	cmp    %eax,0xac0
 707:	89 c2                	mov    %eax,%edx
 709:	75 ed                	jne    6f8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 70b:	83 ec 0c             	sub    $0xc,%esp
 70e:	56                   	push   %esi
 70f:	e8 66 fc ff ff       	call   37a <sbrk>
  if(p == (char*)-1)
 714:	83 c4 10             	add    $0x10,%esp
 717:	83 f8 ff             	cmp    $0xffffffff,%eax
 71a:	74 1c                	je     738 <malloc+0x88>
  hp->s.size = nu;
 71c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 71f:	83 ec 0c             	sub    $0xc,%esp
 722:	83 c0 08             	add    $0x8,%eax
 725:	50                   	push   %eax
 726:	e8 f5 fe ff ff       	call   620 <free>
  return freep;
 72b:	8b 15 c0 0a 00 00    	mov    0xac0,%edx
      if((p = morecore(nunits)) == 0)
 731:	83 c4 10             	add    $0x10,%esp
 734:	85 d2                	test   %edx,%edx
 736:	75 c0                	jne    6f8 <malloc+0x48>
        return 0;
  }
}
 738:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 73b:	31 c0                	xor    %eax,%eax
}
 73d:	5b                   	pop    %ebx
 73e:	5e                   	pop    %esi
 73f:	5f                   	pop    %edi
 740:	5d                   	pop    %ebp
 741:	c3                   	ret    
 742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 748:	39 cf                	cmp    %ecx,%edi
 74a:	74 54                	je     7a0 <malloc+0xf0>
        p->s.size -= nunits;
 74c:	29 f9                	sub    %edi,%ecx
 74e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 751:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 754:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 757:	89 15 c0 0a 00 00    	mov    %edx,0xac0
}
 75d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 760:	83 c0 08             	add    $0x8,%eax
}
 763:	5b                   	pop    %ebx
 764:	5e                   	pop    %esi
 765:	5f                   	pop    %edi
 766:	5d                   	pop    %ebp
 767:	c3                   	ret    
 768:	90                   	nop
 769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 770:	c7 05 c0 0a 00 00 c4 	movl   $0xac4,0xac0
 777:	0a 00 00 
 77a:	c7 05 c4 0a 00 00 c4 	movl   $0xac4,0xac4
 781:	0a 00 00 
    base.s.size = 0;
 784:	b8 c4 0a 00 00       	mov    $0xac4,%eax
 789:	c7 05 c8 0a 00 00 00 	movl   $0x0,0xac8
 790:	00 00 00 
 793:	e9 44 ff ff ff       	jmp    6dc <malloc+0x2c>
 798:	90                   	nop
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 7a0:	8b 08                	mov    (%eax),%ecx
 7a2:	89 0a                	mov    %ecx,(%edx)
 7a4:	eb b1                	jmp    757 <malloc+0xa7>
