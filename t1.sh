#! /bin/sh

testEquality()
{
  assertEquals 1 1
}
echo "current dir:$PWD\n"
echo "this bash pid:$$\n"

testPartyLikeItIs1999()
{
  year=`date '+%Y'`
  assertEquals "It's not 1999 :-( This is ${year}." \
      '1999' "${year}"
}
cd /root/vertxworld
echo "current dir: $PWD\n"
/usr/local/bin/vertx runmod com.m3958.vertxio~vertxcombo~0.0.1.8 1>combo.log 2>&1 &
echo "oldpwd is:$OLDPWD"
echo "last executed pid:$!"
echo $! >/root/vertxworld/pid
cd $OLDPWD
# load shunit2
. ./shunit2



#assertEquals ([message],expected,actual);
#assertNull ([message],value);
#assertNotNull ([message],value);
#assertSame ([message],expected,actual);
#assertNotSame ([message],unexpected,actual);
#assertTrue ([message],condition);
#assertFalse ([message],condition);
#
#
#fail ([message]);
#failNotEquals ([message],unexpected,actual);
#failSame ([message]);
#failNotSame ([message],expected,actual);
#
#suite ();
#suite_addTest (function);
#oneTimeSetUp ();
#oneTimeTearDown ();
#
#setUp ();
#tearDown ();
#
