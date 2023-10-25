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

public class Zlist implements AutoCloseable {
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
    Create a new list container
    */
    native static long __new ();
    public Zlist () {
        /*  TODO: if __new fails, self is null...            */
        self = __new ();
    }
    public Zlist (long pointer) {
        self = pointer;
    }
    /*
    Destroy a list container
    */
    native static void __destroy (long self);
    @Override
    public void close () {
        __destroy (self);
        self = 0;
    }
    /*
    Return the item at the head of list. If the list is empty, returns NULL.
    Leaves cursor pointing at the head item, or NULL if the list is empty.
    */
    native static long __first (long self);
    public long first () {
        return __first (self);
    }
    /*
    Return the next item. If the list is empty, returns NULL. To move to
    the start of the list call zlist_first (). Advances the cursor.
    */
    native static long __next (long self);
    public long next () {
        return __next (self);
    }
    /*
    Return the item at the tail of list. If the list is empty, returns NULL.
    Leaves cursor pointing at the tail item, or NULL if the list is empty.
    */
    native static long __last (long self);
    public long last () {
        return __last (self);
    }
    /*
    Return first item in the list, or null, leaves the cursor
    */
    native static long __head (long self);
    public long head () {
        return __head (self);
    }
    /*
    Return last item in the list, or null, leaves the cursor
    */
    native static long __tail (long self);
    public long tail () {
        return __tail (self);
    }
    /*
    Return the current item of list. If the list is empty, returns NULL.
    Leaves cursor pointing at the current item, or NULL if the list is empty.
    */
    native static long __item (long self);
    public long item () {
        return __item (self);
    }
    /*
    Append an item to the end of the list, return 0 if OK or -1 if this
    failed for some reason (invalid input). Note that if a duplicator has
    been set, this method will also duplicate the item.
    */
    native static int __append (long self, long item);
    public int append (long item) {
        return __append (self, item);
    }
    /*
    Push an item to the start of the list, return 0 if OK or -1 if this
    failed for some reason (invalid input). Note that if a duplicator has
    been set, this method will also duplicate the item.
    */
    native static int __push (long self, long item);
    public int push (long item) {
        return __push (self, item);
    }
    /*
    Pop the item off the start of the list, if any
    */
    native static long __pop (long self);
    public long pop () {
        return __pop (self);
    }
    /*
    Checks if an item already is present. Uses compare method to determine if
    items are equal. If the compare method is NULL the check will only compare
    pointers. Returns true if item is present else false.
    */
    native static boolean __exists (long self, long item);
    public boolean exists (long item) {
        return __exists (self, item);
    }
    /*
    Remove the specified item from the list if present
    */
    native static void __remove (long self, long item);
    public void remove (long item) {
        __remove (self, item);
    }
    /*
    Make a copy of list. If the list has autofree set, the copied list will
    duplicate all items, which must be strings. Otherwise, the list will hold
    pointers back to the items in the original list. If list is null, returns
    NULL.
    */
    native static long __dup (long self);
    public Zlist dup () {
        return new Zlist (__dup (self));
    }
    /*
    Purge all items from list
    */
    native static void __purge (long self);
    public void purge () {
        __purge (self);
    }
    /*
    Return number of items in the list
    */
    native static long __size (long self);
    public long size () {
        return __size (self);
    }
    /*
    Set list for automatic item destruction; item values MUST be strings.
    By default a list item refers to a value held elsewhere. When you set
    this, each time you append or push a list item, zlist will take a copy
    of the string value. Then, when you destroy the list, it will free all
    item values automatically. If you use any other technique to allocate
    list values, you must free them explicitly before destroying the list.
    The usual technique is to pop list items and destroy them, until the
    list is empty.
    */
    native static void __autofree (long self);
    public void autofree () {
        __autofree (self);
    }
    /*
    Self test of this class.
    */
    native static void __test (boolean verbose);
    public static void test (boolean verbose) {
        __test (verbose);
    }
}
