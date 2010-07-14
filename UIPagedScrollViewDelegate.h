
#import <UIKit/UIKit.h>

@protocol UIPagedScrollViewDelegate < UIScrollViewDelegate >

@optional

/**
 * This is triggered on the delegate when we have a page change. We pass along
 * the new page number and the old page number. This method is optional to
 * implement on the delegate.
 *
 * @param unsigned int newNumber
 * @param unsigned int oldNumber
 * @return void 
 */
- (void)scrollViewChangedPage:(unsigned int)newNumber oldPageNumber:(unsigned int)oldNumber;

@end
