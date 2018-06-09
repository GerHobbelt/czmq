/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/

#include "qczmq.h"

///
//  Copy-construct to return the proper wrapped c types
QZframe::QZframe (zframe_t *self, QObject *qObjParent) : QObject (qObjParent)
{
    this->self = self;
}


///
//  Create a new frame. If size is not null, allocates the frame data
//  to the specified size. If additionally, data is not null, copies
//  size octets from the specified data into the frame body.
QZframe::QZframe (const void *data, size_t size, QObject *qObjParent) : QObject (qObjParent)
{
    this->self = zframe_new (data, size);
}

///
//  Create an empty (zero-sized) frame
QZframe* QZframe::newEmpty (QObject *qObjParent)
{
    return new QZframe (zframe_new_empty (), qObjParent);
}

///
//  Create a frame with a specified string content.
QZframe* QZframe::from (const QString &string, QObject *qObjParent)
{
    return new QZframe (zframe_from (string.toUtf8().data()), qObjParent);
}

///
//  Receive frame from socket, returns zframe_t object or NULL if the recv
//  was interrupted. Does a blocking recv, if you want to not block then use
//  zpoller or zloop.
QZframe* QZframe::recv (void *source, QObject *qObjParent)
{
    return new QZframe (zframe_recv (source), qObjParent);
}

///
//  Destroy a frame
QZframe::~QZframe ()
{
    zframe_destroy (&self);
}

///
//  Send a frame to a socket, destroy frame after sending.
//  Return -1 on error, 0 on success.
int QZframe::send (void *dest, int flags)
{
    int rv = zframe_send (&self, dest, flags);
    return rv;
}

///
//  Return number of bytes in frame data
size_t QZframe::size ()
{
    size_t rv = zframe_size (self);
    return rv;
}

///
//  Return address of frame data
byte * QZframe::data ()
{
    byte * rv = zframe_data (self);
    return rv;
}

///
//  Return meta data property for frame
//  The caller shall not modify or free the returned value, which shall be
//  owned by the message.
const QString QZframe::meta (const QString &property)
{
    const QString rv = QString (zframe_meta (self, property.toUtf8().data()));
    return rv;
}

///
//  Create a new frame that duplicates an existing frame. If frame is null,
//  or memory was exhausted, returns null.
QZframe * QZframe::dup ()
{
    QZframe *rv = new QZframe (zframe_dup (self));
    return rv;
}

///
//  Return frame data encoded as printable hex string, useful for 0MQ UUIDs.
//  Caller must free string when finished with it.
QString QZframe::strhex ()
{
    char *retStr_ = zframe_strhex (self);
    QString rv = QString (retStr_);
    zstr_free (&retStr_);
    return rv;
}

///
//  Return frame data copied into freshly allocated string
//  Caller must free string when finished with it.
QString QZframe::strdup ()
{
    char *retStr_ = zframe_strdup (self);
    QString rv = QString (retStr_);
    zstr_free (&retStr_);
    return rv;
}

///
//  Return TRUE if frame body is equal to string, excluding terminator
bool QZframe::streqNoConflict (const QString &string)
{
    bool rv = zframe_streq (self, string.toUtf8().data());
    return rv;
}

///
//  Return frame MORE indicator (1 or 0), set when reading frame from socket
//  or by the zframe_set_more() method
int QZframe::more ()
{
    int rv = zframe_more (self);
    return rv;
}

///
//  Set frame MORE indicator (1 or 0). Note this is NOT used when sending
//  frame to socket, you have to specify flag explicitly.
void QZframe::setMore (int more)
{
    zframe_set_more (self, more);

}

///
//  Return frame routing ID, if the frame came from a ZMQ_SERVER socket.
//  Else returns zero.
quint32 QZframe::routingId ()
{
    uint32_t rv = zframe_routing_id (self);
    return rv;
}

///
//  Set routing ID on frame. This is used if/when the frame is sent to a
//  ZMQ_SERVER socket.
void QZframe::setRoutingId (quint32 routingId)
{
    zframe_set_routing_id (self, (uint32_t) routingId);

}

///
//  Return frame group of radio-dish pattern.
const QString QZframe::group ()
{
    const QString rv = QString (zframe_group (self));
    return rv;
}

///
//  Set group on frame. This is used if/when the frame is sent to a
//  ZMQ_RADIO socket.
//  Return -1 on error, 0 on success.
int QZframe::setGroup (const QString &group)
{
    int rv = zframe_set_group (self, group.toUtf8().data());
    return rv;
}

///
//  Return TRUE if two frames have identical size and data
//  If either frame is NULL, equality is always false.
bool QZframe::eq (QZframe *other)
{
    bool rv = zframe_eq (self, other->self);
    return rv;
}

///
//  Set new contents for frame
void QZframe::reset (const void *data, size_t size)
{
    zframe_reset (self, data, size);

}

///
//  Send message to zsys log sink (may be stdout, or system facility as
//  configured by zsys_set_logstream). Prefix shows before frame, if not null.
void QZframe::print (const QString &prefix)
{
    zframe_print (self, prefix.toUtf8().data());

}

///
//  Probe the supplied object, and report if it looks like a zframe_t.
bool QZframe::is (void *self)
{
    bool rv = zframe_is (self);
    return rv;
}

///
//  Self test of this class.
void QZframe::test (bool verbose)
{
    zframe_test (verbose);

}
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
