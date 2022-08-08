package com.nonage.controller;

import com.nonage.controller.action.*;
public class ActionFactory {
  private static ActionFactory instance = new ActionFactory();
  private ActionFactory() {
    super();
  }
  public static ActionFactory getInstance() {
    return instance;
  }

  public Action getAction(String command) {
    Action action = null;
    System.out.println("ActionFactory  :" + command);
    /* �߰��� �κ� */
    if (command.equals("index")) {
      action = new IndexAction();
    } else if (command.equals("product_detail")) {
      action = new ProductDetailAction();
    } else if (command.equals("catagory")) {
      action = new ProductKindAction();
    } else if (command.equals("contract")) {
      action = new ContractAction();
    } else if (command.equals("join_form")) {
      action = new JoinFormAction();
    } else if (command.equals("id_check_form")) {
      action = new IdCheckFormAction();
    } else if (command.equals("find_zip_num")) {
      action = new FindZipNumAction();
    } else if (command.equals("join")) {
      action = new JoinAction();
    } 
  }
}
