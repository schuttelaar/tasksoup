window.onload = function(){ 
	document.body.addEventListener('change', function(){window.changed = true;});
	document.body.onclick = function(e){
		var trs = document.querySelectorAll('#data_task_list tr');
		for(var j=1; j<trs.length; j++) trs[j].style.opacity=1; //reset all TRs	
		for(var j=1; j<trs.length; j++) {
			if (e.target.getAttribute('class')==='photo') { //Filter photos
				if (!trs[j].querySelectorAll('td img[alt="'+e.target.getAttribute('alt')+'"]').length) {
					trs[j].style.opacity=0.2;
				}

			}
			if (e.target.getAttribute('data-client')!==null) { //Filter clients
				if (!trs[j].querySelectorAll('[data-client="'+e.target.getAttribute('data-client')+'"]').length) {
					trs[j].style.opacity=0.2;
				}
			}
		}
	}
	var a = document.getElementsByTagName('a');
	for(var i=0; i<a.length; i++) {
		a[i].addEventListener('click', function(e){
		if (window.changed) { if (!confirm('Are you sure you want to leave this page ? You have unsaved changes !')) {e.preventDefault();}}});
	}
	var a = document.getElementsByClassName('danger');
	for(var i=0; i<a.length; i++) { a[i].addEventListener('click', function(e){
			if (!confirm('Are you sure you want to apply this operation ?')) e.preventDefault();
		});
	}
	if (document.getElementById('selectall')){ document.getElementById('selectall').onclick = function(){
			var a = document.querySelectorAll('td input[type=checkbox]');
			for(var i=0; i<a.length; i++) a[i].checked = this.checked;
		}
	}
	if (document.getElementById('sidebar')){ 
		var iframe = document.createElement('iframe');
		iframe.style.cssText = 'width:100%;height:400px;margin-top:20px;';
		iframe.src = 'chart.html';document.getElementById('sidebar').appendChild(iframe);
	}
	var tasks = document.querySelectorAll('a.todo,a.done,a.red');
	for(var j=0; j<tasks.length; j++) {
		tasks[j].innerHTML = tasks[j].innerHTML.replace('!!','<span style="cursor:help" title="We cannot begin with this task, there are missing resources!">&#128163;</span>'); 
		tasks[j].innerHTML = tasks[j].innerHTML.replace('[d]','<span style="cursor:help" title="The result of this task has been delivered. Awaiting feedback.">&#128666;</span>');	
		tasks[j].innerHTML = tasks[j].innerHTML.replace('[s]','<span style="cursor:help" title="Support ticket.">&#128222;</span>');	
		tasks[j].innerHTML = tasks[j].innerHTML.replace('[h]','<span style="cursor:help" title="Assistance required... or HELP ME!">&#127868;</span>');	
	}
        var tds = document.querySelectorAll('#data_task_list tr td[data-client]');
        for (var j = 0; j < tds.length; j++) { tds[j].setAttribute('data-client', tds[j].getAttribute('data-client').toLowerCase()) } // for case insensitive compare

	var t = document.getElementById('data_task_list');
	if (t) { var html=''; var base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) };
		for(var i=0; i<t.rows.length; i++) { html += '<tr>';for(var j=0; j<t.rows[i].cells.length; j++) html += '<td>'+t.rows[i].cells[j].textContent+'</td>';html += '</tr>';}
		var html ='<!DOCTYPE html><html><head><meta charset="utf-8" ></head><body><table>'+html+'</table></body></html>';
		var xlsBtn = document.getElementById('xls'); var htmlBtn = document.getElementById('html');
		xlsBtn.setAttribute('href','data:application/vnd.ms-excel;base64,' + base64(html));
		htmlBtn.setAttribute('href','data:text/html;base64,' + base64(html));
	}
}
