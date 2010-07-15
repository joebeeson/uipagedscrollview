#import "UIPagedScrollView.h"

@implementation UIPagedScrollView

@synthesize delegate, page, pageCount;

- (void)setContentOffset:(CGPoint)point {
	
	[super setContentOffset:point];

	if (fmodf(self.contentOffset.x, self.frame.size.width) == 0.0) {
	
		if ([self determinePageByContentOffset] != page) {
		
			[self setPage:currentPage];
			
		}
		
	}
	
}

- (void)setPage:(unsigned int)number {
	
	// Jump out if the requested page is invalid
	if (number < 1 || number > [self pageCount]) return;
	
	if (number != page) {
		
		if ([[self delegate] respondsToSelector:@selector(scrollViewDidChangePage:oldPageNumber:)]) {
			
			[[self delegate] scrollViewDidChangePage:number oldPageNumber:page];
			
		}
			
	}
	
	page = number;
	
}

- (void)scrollToPage:(unsigned int)pageNumber animated:(BOOL)animated {
	
	// Jump out if the requested page is invalid
	if (pageNumber < 1 || pageNumber > [self pageCount]) return;
	
	CGRect pageRectangle = CGRectMake(
		(self.frame.size.width * (pageNumber - 1)),
		0,
		self.frame.size.width,
		self.frame.size.height
	);
	
	[self scrollRectToVisible:pageRectangle animated:animated];
	
}

- (void)setPagingEnabled:(BOOL)value {

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
