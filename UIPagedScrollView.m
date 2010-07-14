#import "UIPagedScrollView.h"

@implementation UIPagedScrollView

@synthesize delegate, page, pageCount;

- (id)init {

	if (self = [super init]) {
	
		[self setPageCount:1];
		[self setPage:1];
		[self setPagingEnabled:YES];
		
	}
	
	return self;
	
}

- (void)setContentOffset:(CGPoint)point {
	
	[super setContentOffset:point];
	
	if (fmodf(self.contentOffset.x, self.frame.size.width) == 0.0) {
	
		NSUInteger currentPage = [self determinePageByContentOffset];
		if (currentPage != page) {
		
			[self setPage:currentPage];
			
		}
		
	}
	
}

- (void)setPage:(unsigned int)number {
	
	// Jump out if the requested page is invalid
	if (number < 0 || number > [self pageCount]) return;
	
	// Keep the old page number around for a second
	unsigned int oldNumber = page;
	page = number;
	
	if ([[self delegate] respondsToSelector:@selector(scrollViewChangedPage:oldPageNumber:)]) {
		
		[[self delegate] scrollViewChangedPage:page oldPageNumber:oldNumber];
		
	}
	
}

- (void)scrollToPage:(unsigned int)pageNumber animated:(BOOL)animated {
	
	// Jump out if the requested page is invalid
	if (pageNumber < 0 || pageNumber > [self pageCount]) return;
	
	CGRect pageRectangle = CGRectMake(
		(self.frame.size.width * (pageNumber - 1)),
		0,
		self.frame.size.width,
		self.frame.size.height
	);
	
	[self scrollRectToVisible:pageRectangle animated:animated];
	
}

- (void)setPagingEnabled:(BOOL)vale {

	[super setPagingEnabled:YES];
	
}

- (unsigned int)determinePageByContentOffset {
	
	CGFloat pageWidth = self.frame.size.width;
	return (floor((self.contentOffset.x - pageWidth / 2) / pageWidth) + 1) + 1;
	
}

- (void)setPageCount:(unsigned int)number {

	// Change our content size to match
	[self setContentSize:CGSizeMake(
		(self.frame.size.width * number),
		self.frame.size.height
	)];

	// Store the value away
	pageCount = number;
	
}

- (void)dealloc {

	[delegate release];
    [super dealloc];

}


@end
