
#import "UIPagedScrollView.h"

@implementation UIPagedScrollView

@synthesize delegate, page, pageCount;

- (void)awakeFromNib {
	
	// We always have at least one page
	[self setPageCount:1];
	
	// We have to have paging enabled
	[self setPagingEnabled:YES];
	
	// Always start on page one
	[self setPage:1];
	
}

- (void)setContentOffset:(CGPoint)point {
	
	[super setContentOffset:point];

	if (fmodf(self.contentOffset.x, self.frame.size.width) == 0.0) {
	
		unsigned int currentPage = (((self.contentOffset.x + self.frame.size.width) * pageCount) / self.contentSize.width);
		
		if (currentPage != page) {
		
			[self setPage:currentPage];
			
		}
		
	}
	
}

- (void)setPage:(unsigned int)number {
	
	// Jump out if the requested page is invalid
	if (number < 1 || number > [self pageCount]) return;
	
	if (number != page) {
		
		int oldPageNumber = page;
		page = number;
		
		if ([[self delegate] respondsToSelector:@selector(scrollViewDidChangePage:oldPageNumber:)]) {
			
			[[self delegate] scrollViewDidChangePage:page oldPageNumber:oldPageNumber];
			
		}
			
	}
	
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
