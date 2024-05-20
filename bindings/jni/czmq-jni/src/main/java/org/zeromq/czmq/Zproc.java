/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
package org.zeromq.czmq;

import org.zeromq.tools.ZmqNativeLoader;

import java.util.LinkedHashMap;
import java.util.Map;

public class Zproc implements AutoCloseable {
    static {
        Map<String, Boolean> libraries = new LinkedHashMap<>();
        libraries.put("zmq", false);
        libraries.put("uuid", true);
        libraries.put("systemd", true);
        libraries.put("lz4", true);
        libraries.put("curl", true);
        libraries.put("nss", true);
        libraries.put("microhttpd", true);
        libraries.put("czmq", false);
        libraries.put("czmqjni", false);
        ZmqNativeLoader.loadLibraries(libraries);
    }
    public long self;
    /*
    Create a new zproc.
    NOTE: On Windows and with libzmq3 and libzmq2 this function
    returns NULL. Code needs to be ported there.
    */
    native static long __new ();
    public Zproc () {
        /*  TODO: if __new fails, self is null...            */
        self = __new ();
    }
    public Zproc (long pointer) {
        self = pointer;
    }
    /*
    Destroy zproc, wait until process ends.
    */
    native static void __destroy (long self);
    @Override
    public void close () {
        __destroy (self);
        self = 0;
    }
    /*
    Return command line arguments (the first item is the executable) or
    NULL if not set.
    */
    native static long __args (long self);
    public Zlist args () {
        return new Zlist (__args (self));
    }
    /*
    Setup the command line arguments, the first item must be an (absolute) filename
    to run.
    */
    native static void __setArgs (long self, long arguments);
    public void setArgs (Zlist arguments) {
        __setArgs (self, arguments.self);
    }
    /*
    Setup the command line arguments, the first item must be an (absolute) filename
    to run. Variadic function, must be NULL terminated.
    */
    native static void __setArgsx (long self, String arguments);
    public void setArgsx (String arguments []) {
        __setArgsx (self, arguments [0]);
    }
    /*
    Setup the environment variables for the process.
    */
    native static void __setEnv (long self, long arguments);
    public void setEnv (Zhash arguments) {
        __setEnv (self, arguments.self);
    }
    /*
    Connects process stdin with a readable ('>', connect) zeromq socket. If
    socket argument is NULL, zproc creates own managed pair of inproc
    sockets.  The writable one is then accessible via zproc_stdin method.
    */
    native static void __setStdin (long self, long socket);
    public void setStdin (long socket) {
        __setStdin (self, socket);
    }
    /*
    Connects process stdout with a writable ('@', bind) zeromq socket. If
    socket argument is NULL, zproc creates own managed pair of inproc
    sockets.  The readable one is then accessible via zproc_stdout method.
    */
    native static void __setStdout (long self, long socket);
    public void setStdout (long socket) {
        __setStdout (self, socket);
    }
    /*
    Connects process stderr with a writable ('@', bind) zeromq socket. If
    socket argument is NULL, zproc creates own managed pair of inproc
    sockets.  The readable one is then accessible via zproc_stderr method.
    */
    native static void __setStderr (long self, long socket);
    public void setStderr (long socket) {
        __setStderr (self, socket);
    }
    /*
    Return subprocess stdin writable socket. NULL for
    not initialized or external sockets.
    */
    native static long __stdin (long self);
    public long stdin () {
        return __stdin (self);
    }
    /*
    Return subprocess stdout readable socket. NULL for
    not initialized or external sockets.
    */
    native static long __stdout (long self);
    public long stdout () {
        return __stdout (self);
    }
    /*
    Return subprocess stderr readable socket. NULL for
    not initialized or external sockets.
    */
    native static long __stderr (long self);
    public long stderr () {
        return __stderr (self);
    }
    /*
    Starts the process, return just before execve/CreateProcess.
    */
    native static int __run (long self);
    public int run () {
        return __run (self);
    }
    /*
    process exit code
    */
    native static int __returncode (long self);
    public int returncode () {
        return __returncode (self);
    }
    /*
    PID of the process
    */
    native static int __pid (long self);
    public int pid () {
        return __pid (self);
    }
    /*
    return true if process is running, false if not yet started or finished
    */
    native static boolean __running (long self);
    public boolean running () {
        return __running (self);
    }
    /*
    The timeout should be zero or greater, or -1 to wait indefinitely.
    wait or poll process status, return return code
    */
    native static int __wait (long self, int timeout);
    public int Wait (int timeout) {
        return __wait (self, timeout);
    }
    /*
    send SIGTERM signal to the subprocess, wait for grace period and
    eventually send SIGKILL
    */
    native static void __shutdown (long self, int timeout);
    public void shutdown (int timeout) {
        __shutdown (self, timeout);
    }
    /*
    return internal actor, useful for the polling if process died
    */
    native static long __actor (long self);
    public long actor () {
        return __actor (self);
    }
    /*
    send a signal to the subprocess
    */
    native static void __kill (long self, int signal);
    public void kill (int signal) {
        __kill (self, signal);
    }
    /*
    set verbose mode
    */
    native static void __setVerbose (long self, boolean verbose);
    public void setVerbose (boolean verbose) {
        __setVerbose (self, verbose);
    }
    /*
    Self test of this class.
    */
    native static void __test (boolean verbose);
    public static void test (boolean verbose) {
        __test (verbose);
    }
}
