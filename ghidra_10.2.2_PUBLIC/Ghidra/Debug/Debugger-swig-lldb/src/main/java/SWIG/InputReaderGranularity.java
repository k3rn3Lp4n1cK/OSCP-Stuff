/* ###
 * IP: Apache License 2.0 with LLVM Exceptions
 */
/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 4.0.1
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package SWIG;

public final class InputReaderGranularity {
  public final static InputReaderGranularity eInputReaderGranularityInvalid = new InputReaderGranularity("eInputReaderGranularityInvalid", lldbJNI.eInputReaderGranularityInvalid_get());
  public final static InputReaderGranularity eInputReaderGranularityByte = new InputReaderGranularity("eInputReaderGranularityByte");
  public final static InputReaderGranularity eInputReaderGranularityWord = new InputReaderGranularity("eInputReaderGranularityWord");
  public final static InputReaderGranularity eInputReaderGranularityLine = new InputReaderGranularity("eInputReaderGranularityLine");
  public final static InputReaderGranularity eInputReaderGranularityAll = new InputReaderGranularity("eInputReaderGranularityAll");

  public final int swigValue() {
    return swigValue;
  }

  public String toString() {
    return swigName;
  }

  public static InputReaderGranularity swigToEnum(int swigValue) {
    if (swigValue < swigValues.length && swigValue >= 0 && swigValues[swigValue].swigValue == swigValue)
      return swigValues[swigValue];
    for (int i = 0; i < swigValues.length; i++)
      if (swigValues[i].swigValue == swigValue)
        return swigValues[i];
    throw new IllegalArgumentException("No enum " + InputReaderGranularity.class + " with value " + swigValue);
  }

  private InputReaderGranularity(String swigName) {
    this.swigName = swigName;
    this.swigValue = swigNext++;
  }

  private InputReaderGranularity(String swigName, int swigValue) {
    this.swigName = swigName;
    this.swigValue = swigValue;
    swigNext = swigValue+1;
  }

  private InputReaderGranularity(String swigName, InputReaderGranularity swigEnum) {
    this.swigName = swigName;
    this.swigValue = swigEnum.swigValue;
    swigNext = this.swigValue+1;
  }

  private static InputReaderGranularity[] swigValues = { eInputReaderGranularityInvalid, eInputReaderGranularityByte, eInputReaderGranularityWord, eInputReaderGranularityLine, eInputReaderGranularityAll };
  private static int swigNext = 0;
  private final int swigValue;
  private final String swigName;
}

