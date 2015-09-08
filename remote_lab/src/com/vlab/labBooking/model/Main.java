package com.vlab.labBooking.model;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Main {
  public static void main(String[] args) {
    Map errors = new HashMap();
    HashMap hmLabSlot = new HashMap();
    LabBooking lB = new LabBooking(); 
    errors.put("404", "A.");
    errors.put("403", "B.");
    errors.put("500", "C.");

    String errorDesc = (String) errors.get("404");
    System.out.println("Error 404: " + errorDesc);
    
    Iterator iterator = errors.keySet().iterator();
    while (iterator.hasNext()) {
      String key = (String) iterator.next();
      System.out.println("Error " + key + " means " + errors.get(key));
    }
    
    try {
		hmLabSlot = lB.getLabSlotCombo();
		iterator = hmLabSlot.keySet().iterator();
	    while (iterator.hasNext()) {
	        int key = (Integer) iterator.next();
	        System.out.println("Error " + key + " means " + hmLabSlot.get(key));
	      }

	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
}