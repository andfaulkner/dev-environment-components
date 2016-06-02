Sockets - what are they?
========================

*   endpoints of a bidirectional communications channel
    *   provide communication:
        *   within a process
        *   between processes on the same machine
        *   between different machines
*   many types of socket:
    *   TCPSocket
    *   UDPSocket
    *   UNIXSocket

Definitions
===========
##Domain
*   family of protocols: Socket::PF_INET, Socket::PF_INET6, Socket::PF_UNIX, etc.
    *   WTF?
##Type
*   type of communication between 2 endpoints, typically:
    *   Socket::SOCK_STREAM
    *   Socket::SOCK_DGRAM
##Protocol
*   usually 0. Used to ID the variant of a protocol
##Hostname
*   Identifier of a network interface
    *   a string (hostname, IPv4 or IPv6 adress or <tt><broadcast></tt>
        which specifies a broadcast address)
    *   a zero-length string which specifies INADDR_ANY
    *   an integer (interpreted as binary address in host byte order).

* Use ruby for this, it looks easy: http://ruby-doc.org/stdlib-1.9.3/libdoc/socket/rdoc/Socket.html
    * quite frankly too low-level, you don't really care
    * (but it's of course good to know what's happening at the system level)