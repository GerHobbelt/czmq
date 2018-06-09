################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
from . import utils
from . import destructors
libczmq_destructors = destructors.lib

class Zchunk(object):
    """
    work with memory chunks
    """

    def __init__(self, data, size):
        """
        Create a new chunk of the specified size. If you specify the data, it
        is copied into the chunk. If you do not specify the data, the chunk is
        allocated and left empty, and you can then add data using zchunk_append.
        """
        p = utils.lib.zchunk_new(data, size)
        if p == utils.ffi.NULL:
            raise MemoryError("Could not allocate person")

        # ffi.gc returns a copy of the cdata object which will have the
        # destructor called when the Python object is GC'd:
        # https://cffi.readthedocs.org/en/latest/using.html#ffi-interface
        self._p = utils.ffi.gc(p, libczmq_destructors.zchunk_destroy_py)

    def resize(self, size):
        """
        Resizes chunk max_size as requested; chunk_cur size is set to zero
        """
        utils.lib.zchunk_resize(self._p, size)

    def size(self):
        """
        Return chunk cur size
        """
        return utils.lib.zchunk_size(self._p)

    def max_size(self):
        """
        Return chunk max size
        """
        return utils.lib.zchunk_max_size(self._p)

    def data(self):
        """
        Return chunk data
        """
        return utils.lib.zchunk_data(self._p)

    def set(self, data, size):
        """
        Set chunk data from user-supplied data; truncate if too large. Data may
        be null. Returns actual size of chunk
        """
        return utils.lib.zchunk_set(self._p, data, size)

    def fill(self, filler, size):
        """
        Fill chunk data from user-supplied octet
        """
        return utils.lib.zchunk_fill(self._p, filler, size)

    def append(self, data, size):
        """
        Append user-supplied data to chunk, return resulting chunk size. If the
        data would exceeded the available space, it is truncated. If you want to
        grow the chunk to accommodate new data, use the zchunk_extend method.
        """
        return utils.lib.zchunk_append(self._p, data, size)

    def extend(self, data, size):
        """
        Append user-supplied data to chunk, return resulting chunk size. If the
        data would exceeded the available space, the chunk grows in size.
        """
        return utils.lib.zchunk_extend(self._p, data, size)

    def consume(self, source):
        """
        Copy as much data from 'source' into the chunk as possible; returns the
        new size of chunk. If all data from 'source' is used, returns exhausted
        on the source chunk. Source can be consumed as many times as needed until
        it is exhausted. If source was already exhausted, does not change chunk.
        """
        return utils.lib.zchunk_consume(self._p, source._p)

    def exhausted(self):
        """
        Returns true if the chunk was exhausted by consume methods, or if the
        chunk has a size of zero.
        """
        return utils.lib.zchunk_exhausted(self._p)

    def read(handle, bytes):
        """
        Read chunk from an open file descriptor
        """
        return utils.lib.zchunk_read(handle, bytes)

    def write(self, handle):
        """
        Write chunk to an open file descriptor
        """
        return utils.lib.zchunk_write(self._p, handle)

    def slurp(filename, maxsize):
        """
        Try to slurp an entire file into a chunk. Will read up to maxsize of
        the file. If maxsize is 0, will attempt to read the entire file and
        fail with an assertion if that cannot fit into memory. Returns a new
        chunk containing the file data, or NULL if the file could not be read.
        """
        return utils.lib.zchunk_slurp(utils.to_bytes(filename), maxsize)

    def dup(self):
        """
        Create copy of chunk, as new chunk object. Returns a fresh zchunk_t
        object, or null if there was not enough heap memory. If chunk is null,
        returns null.
        """
        return utils.lib.zchunk_dup(self._p)

    def strhex(self):
        """
        Return chunk data encoded as printable hex string. Caller must free
        string when finished with it.
        """
        return utils.lib.zchunk_strhex(self._p)

    def strdup(self):
        """
        Return chunk data copied into freshly allocated string
        Caller must free string when finished with it.
        """
        return utils.lib.zchunk_strdup(self._p)

    def streq(self, string):
        """
        Return TRUE if chunk body is equal to string, excluding terminator
        """
        return utils.lib.zchunk_streq(self._p, utils.to_bytes(string))

    def pack(self):
        """
        Transform zchunk into a zframe that can be sent in a message.
        """
        return utils.lib.zchunk_pack(self._p)

    def unpack(frame):
        """
        Transform a zframe into a zchunk.
        """
        return utils.lib.zchunk_unpack(frame._p)

    def digest(self):
        """
        Calculate SHA1 digest for chunk, using zdigest class.
        """
        return utils.lib.zchunk_digest(self._p)

    def fprint(self, file):
        """
        Dump chunk to FILE stream, for debugging and tracing.
        """
        utils.lib.zchunk_fprint(self._p, file)

    def print_py(self):
        """
        Dump message to stderr, for debugging and tracing.
        See zchunk_fprint for details
        """
        utils.lib.zchunk_print(self._p)

    def is_py(self):
        """
        Probe the supplied object, and report if it looks like a zchunk_t.
        """
        return utils.lib.zchunk_is(self._p)

    def test(verbose):
        """
        Self test of this class.
        """
        utils.lib.zchunk_test(verbose)

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
