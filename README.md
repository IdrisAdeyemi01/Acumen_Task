# Acumen Task

#Introduction
This project is an implementation of the Acumen Flutter Assignment Task

#Activities
*Implement the UI given
*Make API calls for the Sign in and Sign up authentication

#Implementation
The project was implemented using the customary similar pattern to MVVM
*The notifiers work as the ViewModel
*The state management package used was Riverpod
*Services that perform functions such as network request, snackbar etc are grouped as well
*Even though the app is meant to be static, I mocked API responses for the ListViews, hence using a ListView builder, so as to make the app feel lively as if it were called from an API

#Limitations
*The design does not have a flow diagram (prototype), hence, I had to gues out some patterns
*Due to this, I made some assumptions:
1. The user goes to the Dashboard directly from the signup and signin pages if successful
2. The Moments and Profile navigation are made empty as I could not find a suitable design for both
3. The pictorial page (Alex Murray page) in the design was assumed to come up when one of the cards of either Near you or Suggested are clicked

 
