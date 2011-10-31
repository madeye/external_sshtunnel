LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

OPENBSD_COMPAT_SRC := base64.c basename.c bindresvport.c bsd-arc4random.c bsd-asprintf.c bsd-closefrom.c bsd-cray.c bsd-cygwin_util.c bsd-getpeereid.c bsd-misc.c bsd-nextstep.c bsd-openpty.c bsd-poll.c bsd-snprintf.c bsd-statvfs.c bsd-waitpid.c daemon.c dirname.c fake-rfc2553.c fmt_scaled.c getcwd.c getgrouplist.c getopt.c glob.c inet_aton.c inet_ntoa.c inet_ntop.c mktemp.c openssl-compat.c port-aix.c port-irix.c port-linux.c port-solaris.c port-tun.c port-uw.c pwcache.c readpassphrase.c realpath.c rresvport.c setenv.c setproctitle.c sha2.c sigact.c strlcat.c strlcpy.c strmode.c strptime.c strsep.c strtoll.c strtonum.c strtoul.c timingsafe_bcmp.c vis.c xcrypt.c xmmap.c 

LOCAL_SRC_FILES := $(foreach T,$(OPENBSD_COMPAT_SRC),openbsd-compat/$(T))

LOCAL_MODULE:= libopenbsd-compat

LOCAL_C_INCLUDES += external/sshtunnel/ external/openssl/include external/zlib

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

#include $(LOCAL_PATH)/openbsd-compat/Android.mk

LOCAL_MODULE := sshtunnel

LIBSSH_OBJS := acss.c authfd.c authfile.c bufaux.c bufbn.c buffer.c \
			canohost.c channels.c cipher.c cipher-acss.c cipher-aes.c \
			cipher-bf1.c cipher-ctr.c cipher-3des1.c cleanup.c \
			compat.c compress.c crc32.c deattack.c fatal.c hostfile.c \
			log.c match.c md-sha256.c moduli.c nchan.c packet.c \
			readpass.c rsa.c ttymodes.c xmalloc.c addrmatch.c \
			atomicio.c key.c dispatch.c kex.c mac.c uidswap.c uuencode.c misc.c \
			monitor_fdpass.c rijndael.c ssh-dss.c ssh-ecdsa.c ssh-rsa.c dh.c \
			kexdh.c kexgex.c kexdhc.c kexgexc.c bufec.c kexecdh.c kexecdhc.c \
			msg.c progressmeter.c dns.c entropy.c gss-genr.c umac.c jpake.c \
			schnorr.c ssh-pkcs11.c

SSHOBJS := ssh.c readconf.c clientloop.c sshtty.c \
		 sshconnect.c sshconnect1.c sshconnect2.c mux.c \
		 roaming_common.c roaming_client.c

OPENSSH_SRC := $(LIBSSH_OBJS) $(SSHOBJS) 

LOCAL_SRC_FILES := $(OPENSSH_SRC) activity.cpp

LOCAL_C_INCLUDES += external/openssl/include external/zlib

LOCAL_STATIC_LIBRARIES := \
	libopenbsd-compat \
	libcrypto \
	libc

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libbinder \
	libutils \
	libz \
	libdl

LOCAL_MODULE_TAGS := eng

include $(BUILD_EXECUTABLE)
