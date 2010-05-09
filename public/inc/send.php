<?php

	require_once('mail.config.php');
	
	
	$email		= $_REQUEST['email'];
	$recipient	= $youremail;
	$subject	= $emailtitle;
	$header		= "From: " . "<" . $email . ">";
	$message	= $emailmsg;
	
	mail($recipient, $subject, $message, $header);
	
	
	// AUTO RESPONSE
	if($autoresponse != 'no')
	{
		$responseheader = "From: " . "<" . $recipient . ">";
		mail($email, $responsetitle, $responsemsg, $responseheader);
	}
?>