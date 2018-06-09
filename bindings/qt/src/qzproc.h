/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
#ifndef Q_ZPROC_H
#define Q_ZPROC_H

#include "qczmq.h"

class QT_CZMQ_EXPORT QZproc : public QObject
{
    Q_OBJECT
public:

    //  Copy-construct to return the proper wrapped c types
    QZproc (zproc_t *self, QObject *qObjParent = 0);

    //  Create a new zproc.
    //  NOTE: On Windows and with libzmq3 and libzmq2 this function
    //  returns NULL. Code needs to be ported there.
    explicit QZproc (QObject *qObjParent = 0);

    //  Destroy zproc, wait until process ends.
    ~QZproc ();

    //  Return command line arguments (the first item is the executable) or
    //  NULL if not set.
    QZlist * args ();

    //  Setup the command line arguments, the first item must be an (absolute) filename
    //  to run.
    void setArgs (QZlist *arguments);

    //  Setup the environment variables for the process.
    void setEnv (QZhash *arguments);

    //  Connects process stdin with a readable ('>', connect) zeromq socket. If
    //  socket argument is NULL, zproc creates own managed pair of inproc
    //  sockets.  The writable one is then accessbile via zproc_stdin method.
    void setStdin (void *socket);

    //  Connects process stdout with a writable ('@', bind) zeromq socket. If
    //  socket argument is NULL, zproc creates own managed pair of inproc
    //  sockets.  The readable one is then accessbile via zproc_stdout method.
    void setStdout (void *socket);

    //  Connects process stderr with a writable ('@', bind) zeromq socket. If
    //  socket argument is NULL, zproc creates own managed pair of inproc
    //  sockets.  The readable one is then accessbile via zproc_stderr method.
    void setStderr (void *socket);

    //  Return subprocess stdin writable socket. NULL for
    //  not initialized or external sockets.
    void * stdin ();

    //  Return subprocess stdout readable socket. NULL for
    //  not initialized or external sockets.
    void * stdout ();

    //  Return subprocess stderr readable socket. NULL for
    //  not initialized or external sockets.
    void * stderr ();

    //  Starts the process, return just before execve/CreateProcess.
    int run ();

    //  process exit code
    int returncode ();

    //  PID of the process
    int pid ();

    //  return true if process is running, false if not yet started or finished
    bool running ();

    //  The timeout should be zero or greater, or -1 to wait indefinitely.
    //  wait or poll process status, return return code
    int wait (int timeout);

    //  send SIGTERM signal to the subprocess, wait for grace period and
    //  eventually send SIGKILL
    void shutdown (int timeout);

    //  return internal actor, useful for the polling if process died
    void * actor ();

    //  send a signal to the subprocess
    void kill (int signal);

    //  set verbose mode
    void setVerbose (bool verbose);

    //  Self test of this class.
    static void test (bool verbose);

    zproc_t *self;
};
#endif //  Q_ZPROC_H
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
