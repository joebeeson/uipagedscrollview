/**
 * UIPagedScrollView
 *
 * Handles a handful of paging related tasks commonly required by UIScrollView
 * instances that having paging enabled.
 *
 * @author Joe Beeson <jbeeson@gmail.com>
 */

#import <UIKit/UIKit.h>
#import "UIPagedScrollViewDelegate.h"

@interface UIPagedScrollView : UIScrollView {

	/**
	 * The delegate we will send notifications to. Must implement our protocol
	 * which is derived from UIScrollViewDelegate.
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

@property (nonatomic, assign) id < UIPagedScrollViewDelegate > delegate;
@property (nonatomic) unsigned int page;
@property (nonatomic) unsigned int pageCount;

@end
