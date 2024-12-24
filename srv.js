const chokidar = require('chokidar');
const fs = require('fs-extra');
const pathBase = 'BASE_PATH/'
const pathTracking = pathBase + 'BASE_TARGET/'
const pathTarget = pathBase + 'BASE_DST/'
const lenBase = pathBase.length

const watcher = chokidar.watch(pathTracking, {
    ignored: /(^|[\/\\])\../, // ignore dotfiles
    persistent: true
});

var log = console.log.bind(console);

function createDir(path)
{
	if (!fs.existsSync(path)) {
		fs.mkdirSync(path);
	}
}

createDir(pathTarget);

watcher
.on('add',		(path) =>  {
	console.log('File', path, 'has been changed File [', pathTarget + path.substr(lenBase), ']');
	fs.copy(path, pathTarget + path.substr(lenBase), function(err){
		if (err) return console.error(err);
		console.log("success!")
	});
})
.on('addDir',		(path) =>  {
	console.log('Directory', path, 'has been added Dir [', pathTarget + path.substr(lenBase), ']');
	createDir(pathTarget + path.substr(lenBase));
})
.on('change',		(path) =>  {
	console.log('File', path, 'has been changed File [', pathTarget + path.substr(lenBase), ']');
	fs.copy(path, pathTarget + path.substr(lenBase), function(err){
		if (err) return console.error(err);
		console.log("success!")
	});
})
/*.on('unlink',		(path) =>  {
	console.log('File', path, 'has been removed File [', pathTarget + path.substr(lenBase), ']');
	
	fs.stat(pathTarget + path.substr(lenBase), function(err, stat) {
		if(err == null) {
			console.log('File exists');
			fs.unlink(pathTarget + path.substr(lenBase), err => {
				console.error(err)
			})
		}
	});
})
.on('unlinkDir',	(path) =>  {
	console.log('Directory', path, 'has been removed Dir [', pathTarget + path.substr(lenBase), ']');
	if (fs.existsSync(pathTarget + path.substr(lenBase))) {
		fs.remove(pathTarget + path.substr(lenBase), err => {
			console.error(err)
		})
	}
})
*/
.on('error',		(error) => {
	console.error('Error happened', error);
})
