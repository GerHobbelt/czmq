################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module CZMQ
  module FFI

    # process configuration and status
    # @note This class is 100% generated using zproject.
    class Zproc
      # Raised when one tries to use an instance of {Zproc} after
      # the internal pointer to the native object has been nullified.
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      # Attaches the pointer _ptr_ to this instance and defines a finalizer for
      # it if necessary.
      # @param ptr [::FFI::Pointer]
      # @param finalize [Boolean]
      def initialize(ptr, finalize = true)
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      # @param ptr [::FFI::Pointer]
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        ptr_ptr = ::FFI::MemoryPointer.new :pointer

        Proc.new do
          ptr_ptr.write_pointer ptr
          ::CZMQ::FFI.zproc_destroy ptr_ptr
        end
      end
      # @return [Boolean]
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      # @return [::FFI::Pointer]
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer.
      # @note This detaches the current instance from the native object
      #   and thus makes it unusable.
      # @return [::FFI::MemoryPointer] the pointer pointing to a pointer
      #   pointing to the native object
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        __undef_finalizer if @finalizer
        @ptr = nil
        ptr_ptr
      end
      # Undefines the finalizer for this object.
      # @note Only use this if you need to and can guarantee that the native
      #   object will be freed by other means.
      # @return [void]
      def __undef_finalizer
        ObjectSpace.undefine_finalizer self
        @finalizer = nil
      end

      # Create a new zproc.
      # NOTE: On Windows and with libzmq3 and libzmq2 this function
      # returns NULL. Code needs to be ported there.
      # @return [CZMQ::Zproc]
      def self.new()
        ptr = ::CZMQ::FFI.zproc_new()
        __new ptr
      end

      # Destroy zproc, wait until process ends.
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zproc_destroy(self_p)
        result
      end

      # Return command line arguments (the first item is the executable) or
      # NULL if not set.
      #
      # @return [Zlist]
      def args()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_args(self_p)
        result = Zlist.__new result, true
        result
      end

      # Setup the command line arguments, the first item must be an (absolute) filename
      # to run.
      #
      # @param arguments [#__ptr_give_ref]
      # @return [void]
      def set_args(arguments)
        raise DestroyedError unless @ptr
        self_p = @ptr
        arguments = arguments.__ptr_give_ref
        result = ::CZMQ::FFI.zproc_set_args(self_p, arguments)
        result
      end

      # Setup the command line arguments, the first item must be an (absolute) filename
      # to run. Variadic function, must be NULL terminated.
      #
      # @param arguments [String, #to_s, nil]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [void]
      def set_argsx(arguments, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_set_argsx(self_p, arguments, *args)
        result
      end

      # Setup the environment variables for the process.
      #
      # @param arguments [#__ptr_give_ref]
      # @return [void]
      def set_env(arguments)
        raise DestroyedError unless @ptr
        self_p = @ptr
        arguments = arguments.__ptr_give_ref
        result = ::CZMQ::FFI.zproc_set_env(self_p, arguments)
        result
      end

      # Connects process stdin with a readable ('>', connect) zeromq socket. If
      # socket argument is NULL, zproc creates own managed pair of inproc
      # sockets.  The writable one is then accessible via zproc_stdin method.
      #
      # @param socket [::FFI::Pointer, #to_ptr]
      # @return [void]
      def set_stdin(socket)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_set_stdin(self_p, socket)
        result
      end

      # Connects process stdout with a writable ('@', bind) zeromq socket. If
      # socket argument is NULL, zproc creates own managed pair of inproc
      # sockets.  The readable one is then accessible via zproc_stdout method.
      #
      # @param socket [::FFI::Pointer, #to_ptr]
      # @return [void]
      def set_stdout(socket)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_set_stdout(self_p, socket)
        result
      end

      # Connects process stderr with a writable ('@', bind) zeromq socket. If
      # socket argument is NULL, zproc creates own managed pair of inproc
      # sockets.  The readable one is then accessible via zproc_stderr method.
      #
      # @param socket [::FFI::Pointer, #to_ptr]
      # @return [void]
      def set_stderr(socket)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_set_stderr(self_p, socket)
        result
      end

      # Return subprocess stdin writable socket. NULL for
      # not initialized or external sockets.
      #
      # @return [::FFI::Pointer]
      def stdin()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_stdin(self_p)
        result
      end

      # Return subprocess stdout readable socket. NULL for
      # not initialized or external sockets.
      #
      # @return [::FFI::Pointer]
      def stdout()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_stdout(self_p)
        result
      end

      # Return subprocess stderr readable socket. NULL for
      # not initialized or external sockets.
      #
      # @return [::FFI::Pointer]
      def stderr()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_stderr(self_p)
        result
      end

      # Starts the process, return just before execve/CreateProcess.
      #
      # @return [Integer]
      def run()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_run(self_p)
        result
      end

      # process exit code
      #
      # @return [Integer]
      def returncode()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_returncode(self_p)
        result
      end

      # PID of the process
      #
      # @return [Integer]
      def pid()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_pid(self_p)
        result
      end

      # return true if process is running, false if not yet started or finished
      #
      # @return [Boolean]
      def running()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_running(self_p)
        result
      end

      # The timeout should be zero or greater, or -1 to wait indefinitely.
      # wait or poll process status, return return code
      #
      # @param timeout [Integer, #to_int, #to_i]
      # @return [Integer]
      def wait(timeout)
        raise DestroyedError unless @ptr
        self_p = @ptr
        timeout = Integer(timeout)
        result = ::CZMQ::FFI.zproc_wait(self_p, timeout)
        result
      end

      # send SIGTERM signal to the subprocess, wait for grace period and
      # eventually send SIGKILL
      #
      # @param timeout [Integer, #to_int, #to_i]
      # @return [void]
      def shutdown(timeout)
        raise DestroyedError unless @ptr
        self_p = @ptr
        timeout = Integer(timeout)
        result = ::CZMQ::FFI.zproc_shutdown(self_p, timeout)
        result
      end

      # return internal actor, useful for the polling if process died
      #
      # @return [::FFI::Pointer]
      def actor()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zproc_actor(self_p)
        result
      end

      # send a signal to the subprocess
      #
      # @param signal [Integer, #to_int, #to_i]
      # @return [void]
      def kill(signal)
        raise DestroyedError unless @ptr
        self_p = @ptr
        signal = Integer(signal)
        result = ::CZMQ::FFI.zproc_kill(self_p, signal)
        result
      end

      # set verbose mode
      #
      # @param verbose [Boolean]
      # @return [void]
      def set_verbose(verbose)
        raise DestroyedError unless @ptr
        self_p = @ptr
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zproc_set_verbose(self_p, verbose)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zproc_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
