// Original script @ http://sdm3.rm04.net/ui/library/formValidate.js
// This script has been mod and is NOT the same as the original!!

/* Validates a form called "form", for use with the opt-in and preferences forms. */
function f_validateForm(a_sFormName)
{
   if (typeof(a_sFormName) == "undefined")
   {
      a_sFormName = "form";
   }
   var l_okay = true;

   for (var j=0; j < document.forms[a_sFormName].elements.length; j++)
   {
      var l_element = document.forms[a_sFormName].elements[j];
      f_useHiddenFieldIfCheckbox(l_element);

      var sFieldNameRequired = l_element.name + "_REQUIRED";
      var elRequired = document.forms[a_sFormName].elements[sFieldNameRequired];

      if (elRequired)
      {
         if (elRequired.value == "T" && l_element.value == "")
         {
            alert("You must fill in the email address.");
            return;
         }
      }
      //text areas can only be 255 in size
      if(l_element.type == "textarea")
      {
         if (l_element.value.length > 255)
         {
            alert("Please limit your entries to only 255 characters");
            return;
         }
      }
      //SHOUlD REWRITE this cr@P and not use formValidate. Only have an email address so not doing it now! 
      if(l_element.id.indexOf("email") >=0) { 
          l_okay = f_isValidEmail(l_element.value);
          if (!l_okay)
          {
              l_element.focus();
              return;
          }
      }
    }
   //TODO put into /js/silverpop.js as shared ajax 
   $.get('/ajax-signUpNewsLetter.jspa?a=' + Math.random() + '&email='+document.forms[a_sFormName].EMAIL.value, 
           function (data) { 
               var obj = jQuery.parseJSON(data);
               //obj.hasError = true;
               //obj.error = "aaaahhhh"
               if(obj.hasError) { 
                   window.open('/silverpop/errorLHN.jsp?theerror=' + escape(obj.error),'NewsLetterSignUp','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=180,left=120,top=120');
               } else { 
                   if(obj.type == 'signin') {
                       window.location.href=obj.https + "/content/account/SSL/signIn-form.jspa" 
                   } else if(obj.type == 'prefs') { 
                       window.location.href=obj.http + "/profile/" + obj.userId + "/preferences" 
                   } else { 
                       window.open('/silverpop/thankYou.jsp','NewsLetterSignUp','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=610,height=190,left=120,top=120');
                   }     
               }     
           }
       );     
   
}

/*Deprecated
function f_validateForm_dest(a_sFormName)
{
   if (typeof(a_sFormName) == "undefined")
   {
      a_sFormName = "form";
   }
   var l_okay = true;

   for (var j=0; j < document.forms[a_sFormName].elements.length; j++)
   {
      var l_element = document.forms[a_sFormName].elements[j];
      f_useHiddenFieldIfCheckbox(l_element);

      var sFieldNameRequired = l_element.name + "_REQUIRED";
      var elRequired = document.forms[a_sFormName].elements[sFieldNameRequired];

      if (elRequired)
      {
         if (elRequired.value == "T" && l_element.value == "")
         {
            alert("You must fill in all the required fields.");
            return;
         }
      }
      //text areas can only be 255 in size
      if(l_element.type == "textarea")
      {
         if (l_element.value.length > 255)
         {
            alert("Please limit your entries to only 255 characters");
            return;
         }
      }
      var sFieldNameDataType = l_element.name + "_DATATYPE";
      var elDataType = document.forms[a_sFormName].elements[sFieldNameDataType];

      if (elDataType)
      {
         if (l_element.value != "")
         {
            if (elDataType.value == "email")
            {               if (typeof(onloadIfrIDArray) != 'undefined') {

               l_okay = f_isValidEmail(l_element.value);
            }
            if (!l_okay)
            {
               l_element.focus();
               return;
            }
         }
      }
   }

   var email_type;
   for (var i=0; i < document.forms[a_sFormName].EMAIL_TYPE.length; i++)
   {
      if (document.forms[a_sFormName].EMAIL_TYPE[i].checked)
      {
         email_type = document.forms[a_sFormName].EMAIL_TYPE[i].value;
      }
   }
   if (typeof(email_type) == "undefined") email_type = document.forms[a_sFormName].EMAIL_TYPE.value;

   var nlSubscription;
   if (document.forms[a_sFormName].nlSubscription.checked)
      nlSubscription = true;
   else
      nlSubscription = false;

   window.open('/destSubscribeNewsLetter.jspa?email='+document.forms[a_sFormName].EMAIL.value+'&country='+document.forms[a_sFormName].Country.value+'&type='+email_type+'&spDestinationID='+document.forms[a_sFormName].spDestinationID.value+'&spDestinationName='+document.forms[a_sFormName].spDestinationName.value+'&nlSubscription='+nlSubscription,'NewsLetterSignUp','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=550,height=380,left=120,top=120');
}
*/ 

/* checkboxes that have SYSTEM_ before their name should have an accompanying hidden
 field, that does not have the SYSTEM_.  This field should be "Yes" if the checkbox
 is checked, and "No" if it is not */
function f_useHiddenFieldIfCheckbox(a_element)
{
   if (a_element.type == "checkbox" && a_element.name.substring(0, 7) == "SYSTEM_")
   {
      var hiddenElement = eval("document.form.elements['" + a_element.name.substring(7) +"']");

      if (a_element.checked)
      {
         hiddenElement.value = "Yes";
      }
      else
      {
         hiddenElement.value = "No";
      }
   }
}

/* The following are common validation routines used by any screens that need to
 * validate user input.
 */
/* Checks if an email address is valid, modified from http://javascript.internet.com/forms/check-email.html
*/
function f_isValidEmail(a_sEmail)
{
   if (a_sEmail != null && a_sEmail != "")
   {
      /* The following pattern is used to check if the entered e-mail address
         fits the user@domain format.  It also is used to separate the username
         from the domain. */
      var emailPat=/^(.+)@(.+)$/;
      /* The following string represents the pattern for matching all special
         characters.  We don't want to allow special characters in the address.
         These characters include ( ) < > @ , ; : \ " . [ ]    */
      var specialCharsUser="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
      var specialCharsDomain="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]\\'";

      /* The following string represents the range of characters allowed in a
         username or domainname.  It really states which chars aren't allowed. */
      var validCharsUser="\[^\\s" + specialCharsUser + "\]";
      var validCharsDomain="\[^\\s" + specialCharsDomain + "\]";
      /* The following pattern applies if the "user" is a quoted string (in
         which case, there are no rules about which characters are allowed
         and which aren't; anything goes).  E.g. "jiminy cricket"@disney.com
         is a legal e-mail address. */
      var quotedUser="(\"[^\"]*\")";
      /* The following pattern applies for domains that are IP addresses,
         rather than symbolic names.  E.g. joe@[123.124.233.4] is a legal
         e-mail address. NOTE: The square brackets are required. */
      var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;
      /* The following string represents an atom (basically a series of
         non-special characters.) */
      var atomUser=validCharsUser + '+';
      var atomDomain=validCharsDomain + '+';
      /* The following string represents one word in the typical username.
         For example, in john.doe@somewhere.com, john and doe are words.
         Basically, a word is either an atom or quoted string. */
      var wordUser="(" + atomUser + "|" + quotedUser + ")";
      // The following pattern describes the structure of the user
      var userPat=new RegExp("^" + wordUser + "(\\." + wordUser + ")*$");
      /* The following pattern describes the structure of a normal symbolic
         domain, as opposed to ipDomainPat, shown above. */
      var domainPat=new RegExp("^" + atomDomain + "(\\." + atomDomain +")*$");


      /* Finally, let's start trying to figure out if the supplied address is
         valid. */

      /* Begin with the coarse pattern to simply break up user@domain into
         different pieces that are easy to analyze. */
      var matchArray=a_sEmail.match(emailPat);
      if (matchArray==null)
      {
        /* Too many/few @'s or something; basically, this address doesn't
           even fit the general mould of a valid e-mail address. */
      	alert("The format of the email address you entered is not valid for email addresses.");
      	return false;
      }
      var user=matchArray[1];
      var domain=matchArray[2];

      // See if "user" is valid
      if (user.match(userPat)==null)
      {
          // user is not valid
          alert("Email username doesn't seem to be valid.");
          return false;
      }

      /* if the e-mail address is at an IP address (as opposed to a symbolic
         host name) make sure the IP address is valid. */
      var IPArray=domain.match(ipDomainPat);
      if (IPArray!=null)
      {
          // this is an IP address
      	  for (var i=1;i<=4;i++)
           {
      	    if (IPArray[i]>255)
             {
      	        alert("Email IP address is invalid!");
      		     return false;
      	    }
          }
          return true;
      }

      // Domain is symbolic name
      var domainArray=domain.match(domainPat);
      if (domainArray==null)
      {
      	alert("Email domain name doesn't seem to be valid.");
         return false;
      }

      /* domain name seems valid, but now make sure that it ends in a
         three-letter word (like com, edu, gov) or a two-letter word,
         representing country (uk, nl), and that there's a hostname preceding
         the domain or country. */

      /* Now we need to break up the domain to get a count of how many atoms
         it consists of. */
      var atomPat=new RegExp(atomDomain,"g");
      var domArr=domain.match(atomPat);
      var len=domArr.length;
      if (domArr[domArr.length-1].length<2 ||
          domArr[domArr.length-1].length>4)
      {
         // the address must end in a two letter or three letter word.
         alert("Email address must end in a three or four letter domain or a two letter country.");
         return false;
      }

      // Make sure there's a host name preceding the domain.
      if (len<2)
      {
         var errStr="Email address is missing a hostname.";
         alert(errStr);
         return false;
      }
   }

   // If we've gotten this far, everything's valid!
   return true;
}
