{*
 * Support Snippet Template
 * @docs https://kreativkonzentrat.de/Wiki?page=dropper/dev/template
 * @generator https://kreativkonzentrat.de/Drop-Builder
 *}



<div class="service-drop" data-drop-id="{$drop._internal.guid}">
	<hr>
	<div class="pl-3 pr-3">
		{if !empty($drop.phonetext) && !empty($drop.phone)}
			<div class="upper">
				<a href="tel:{$drop.phone}" title="{$drop.phonetext}" class="h2"><i class="fa fa-phone"></i> {$drop.phonetext}</a>
				<div class="service-status">
					<div class="service-text d-flex flex-row-reverse"> 
						<span class="text text-open d-none">{$drop.opened}</span>
						<span class="text text-close">{$drop.closed}</span>
						<span class="pill"></span>
					</div>
				</div>
			</div>
		{/if}
		{if !empty($drop.freetext)}
			<div class="lower">
				{$drop.freetext}
			</div>
		{/if}
	</div>
</div>

<script type="text/javascript">

function checkServiceStatus() {
    const d = new Date();
    let day = d.getDay();  // Get current day (0=Sunday, 1=Monday, etc.)

    // Loop through $drop.serviceday to find the current day
    const serviceday = {$drop.serviceday|json_encode}; // Make sure $drop.serviceday is available in JavaScript
	//console.log(serviceday);  // This will log the PHP array as a JavaScript object
    serviceday.forEach(function(dayData) {
        if (dayData.daystring == day) {  // Compare with current day
			//console.log("current day found");
            // If opentimeswitch is "switch", check for both AM and PM open times
            if (dayData.opentimeswitch == 'split') {
				console.log("split");
                const currentTime = d.getHours() * 60 + d.getMinutes(); // Convert current time to minutes

                const dayOpenAm = parseTime(dayData.dayopenam);
                const dayCloseAm = parseTime(dayData.daycloseam);
                const dayOpenPm = parseTime(dayData.dayopenpm);
                const dayClosePm = parseTime(dayData.dayclosepm);

                // Check if current time is between opening and closing times
                if ((currentTime >= dayOpenAm && currentTime <= dayCloseAm) || 
                    (currentTime >= dayOpenPm && currentTime <= dayClosePm)) {
                    $(".service-text .text-open").removeClass("d-none");
                    $(".service-text .text-close").addClass("d-none");
                } else {
                    $(".service-text .text-close").removeClass("d-none");
                    $(".service-text .text-open").addClass("d-none");
                }
            }

            // If opentimeswitch is "union", check if current time is between dayopenam and dayclosepm
            if (dayData.opentimeswitch == 'union') {
				console.log("union");
                const currentTime = d.getHours() * 60 + d.getMinutes(); // Convert current time to minutes
                const dayOpenAm = parseTime(dayData.dayopenam);
                const dayClosePm = parseTime(dayData.dayclosepm);

                // Check if current time is between dayOpenAm and dayClosePm
                if (currentTime >= dayOpenAm && currentTime <= dayClosePm) {
                    $(".service-text .text-open").removeClass("d-none");
                    $(".service-text .text-close").addClass("d-none");
                } else {
                    $(".service-text .text-close").removeClass("d-none");
                    $(".service-text .text-open").addClass("d-none");
                }
            }
        }
    });
}

// Helper function to convert time in "HH:mm" format to minutes
function parseTime(timeString) {
	const [hours, minutes] = timeString.split(':');
	return parseInt(hours) * 60 + parseInt(minutes);  // Convert time to minutes
}

// check status on init
checkServiceStatus();

// recheck every minute
setInterval(checkServiceStatus, 60000);

</script>