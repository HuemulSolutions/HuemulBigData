package com.huemulsolutions.bigdata.common

class huemul_DateTimePart(MiliSeconds: Long) extends Serializable {
  private var calc = MiliSeconds / 1000
  val second: Long = calc % 60
  calc /= 60
  val minute: Long = calc % 60
  calc /= 60
  val hour: Long = calc % 24
  calc /= 24
  val days: Long = calc

}