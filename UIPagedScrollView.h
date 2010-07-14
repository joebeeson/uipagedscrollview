
#import <UIKit/UIKit.h>
#import "UIPagedScrollViewDelegate.h"

@interface UIPagedScrollView : UIScrollView {

	/**
	 * Sets our delegate instance to requiring to implement our delegate, which
	 * inherits the UIScrollViewDelegate and adds a couple optional methods.
	 *
	 * @var id
	 * @protocol UIPagedScrollViewDelegate
	 */
	id < UIPagedScrollViewDelegate > delegate;
	
	/**
	 * Holds the current page number that we are on.
	 *
	 * @var unsigned int
	 */
	unsigned int page;
	
	/**
	 * Holds the number of pages that we have "in" our view.
	 *
	 * @var unsigned int
	 */
	unsigned int pageCount;
	
}

/**
 * Scrolls the view to the requested page and animates if asked.
 *
 * @param unsigned int pageNumber
 * @param boolean animated
 * @return void
 */
- (void)scrollToPage:(unsigned int)pageNumber animated:(BOOL)animated;

/**
 * Inspects the contentOffset value to determine which page we are currently
 * viewing.
 *
 * @return unsigned int
 */
- (unsigned int)determinePageByContentOffset;

@property (nonatomic, assign) id < UIPagedScrollViewDelegate > delegate;
@property (nonatomic) NSUInteger page;
@property (nonatomic) NSUInteger pageCount;

@end
