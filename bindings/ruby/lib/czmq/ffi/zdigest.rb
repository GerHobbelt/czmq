################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module CZMQ
  module FFI

    # provides hashing functions (SHA-1 at present)
    # @note This class is 100% generated using zproject.
    class Zdigest
      # Raised when one tries to use an instance of {Zdigest} after
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
          ::CZMQ::FFI.zdigest_destroy ptr_ptr
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

      # Constructor - creates new digest object, which you use to build up a
      # digest by repeatedly calling zdigest_update() on chunks of data.
      # @return [CZMQ::Zdigest]
      def self.new()
        ptr = ::CZMQ::FFI.zdigest_new()
        __new ptr
      end

      # Destroy a digest object
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zdigest_destroy(self_p)
        result
      end

      # Add buffer into digest calculation
      #
      # @param buffer [::FFI::Pointer, #to_ptr]
      # @param length [Integer, #to_int, #to_i]
      # @return [void]
      def update(buffer, length)
        raise DestroyedError unless @ptr
        self_p = @ptr
        length = Integer(length)
        result = ::CZMQ::FFI.zdigest_update(self_p, buffer, length)
        result
      end

      # Return final digest hash data. If built without crypto support,
      # returns NULL.
      #
      # @return [::FFI::Pointer]
      def data()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdigest_data(self_p)
        result
      end

      # Return final digest hash size
      #
      # @return [Integer]
      def size()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdigest_size(self_p)
        result
      end

      # Return digest as printable hex string; caller should not modify nor
      # free this string. After calling this, you may not use zdigest_update()
      # on the same digest. If built without crypto support, returns NULL.
      #
      # @return [::FFI::Pointer]
      def string()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdigest_string(self_p)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zdigest_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
