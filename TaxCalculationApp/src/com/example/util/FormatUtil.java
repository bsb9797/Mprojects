package com.example.util;

import java.text.DecimalFormat;

public final class FormatUtil {
 
    private static final DecimalFormat TWO_DECIMAL_FORMAT = new DecimalFormat("0.00");
 
    private FormatUtil() {
    }
 
    public static String formatAmount(double value) {
        return TWO_DECIMAL_FORMAT.format(value);
    }
}
