
void usage() {
	printf("Usage: CLDownload http://url /path/to/file\nDon't forget http:// from the link!\nIf you want to donate to me type: CLDownload --donate\n");
	exit(0); //Exit the program after printing the help
}

void donate() {
	printf("If you want to donate to me open bit.ly/Nf79pc\nThank You!\n");        
	exit(0);
}

int main(int argc, char **argv, char **envp) {
	if (argc < 2) { usage(); } //If there isn't argv[1] printf the usage
	if (strcmp(argv[1], "--help") == 0) { usage(); } //If argv[1] = --help print the help
	if (strcmp(argv[1], "--donate") == 0) { donate(); }
	if (argc < 3) { usage(); } //If there isn't argv[1] and/or argv[2] printf the usage
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSString *link = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding]; //Convert argv[1] to NSString*
	printf("Link you entered: "); printf(argv[1]); printf("\n");
	printf("Downloading the data...\n");
	NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:link]]; //Download the data from the URL
	if (!data) { printf("There isn't anything on the link!\n"); usage(); } // If the data is nil print a message and the usage
	NSString *path = [NSString stringWithCString:argv[2] encoding:NSUTF8StringEncoding]; //Convert argv[2] to this NSString*
	[data writeToFile:path atomically:YES]; //Write the data to the path
	printf("File written\n");
	[pool release];
	return 0;
}


// vim:ft=objc
