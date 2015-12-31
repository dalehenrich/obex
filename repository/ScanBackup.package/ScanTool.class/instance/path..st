other
path: aString

	self open: aString.
	[
		self readFile.
	] ensure: [
		file close.
	].
