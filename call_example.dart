//import login_form_template_file

//create these variables
var signupKey = GlobalKey<FormState>();
var usernameController = TextEditingController();
var passwordController = TextEditingController();
var confirmPasswordController = TextEditingController();

defaultSignupForm(
            signupKey: signupKey,
            usernameController: usernameController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            onPressed:  (){
              if(signupKey.currentState!.validate())
              {
                print(usernameController.text);
                print(passwordController.text);
                print(confirmPasswordController.text);
              }
            },
            suffixPressed: ()
            {
              setState(()
              {
                signupIsPassword = !signupIsPassword;
              });
            },
        )
