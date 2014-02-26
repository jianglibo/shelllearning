#! /bin/sh

testEquality()
{
  assertEquals 1 1
}

testPartyLikeItIs1999()
{
  year=`date '+%Y'`
  assertEquals "It's not 1999 :-( This is ${year}." \
      '1999' "${year}"
}

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
