$(document).ready(function(){
    fm_options = {
        jQueryUI : false,
        position : "left-bottom",
        name_placeholder:"Name please",
        trigger_label : "Feedback",
        title_label: "Tell us what you think",
        name_required: true,
        message_required : true,
        show_asterisk_for_required : true,
        show_email: true,
        email_required: true,
        feedback_url: "/feedback",
        delayed_options: {
            send_fail : "Could not send your feedback currently. Try again later.",
            send_success : "Thank you for feedback. It has been mailed to Kalakrati team."
        }
    };

    fm.init(fm_options);
});