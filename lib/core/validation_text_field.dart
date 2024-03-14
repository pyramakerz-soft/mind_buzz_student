abstract class ValidationTextField{
  static emailInput(String? value){
    if(value==null || value.isEmpty){
      return "Please Enter Email";
    }else if(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
      return "Please Enter valid Email";
    }else{
      return;
    }
  }

  static passwordInput(String? value){
    if(value==null || value.isEmpty){
      return "Please Enter Password";
    }else{
      return;
    }
  }
}