#ifndef NOTIFY_h 
#define NOTIFY_h 1

#define DEFAULT_COMMAND "/system/bin/sh"

#define VERSION "2.3.2-efgh"

#define SUCCESS     0
#define FATAL       1
#define ERROR       2
#define PROMPT      3

extern int send_intent(int type, const char* status);

#define PLOGE(fmt,args...) LOGE(fmt " failed with %d: %s" , ## args , errno, strerror(errno))
#define PLOGEV(fmt,err,args...) LOGE(fmt " failed with %d: %s" , ## args , err, strerror(err))

#endif
