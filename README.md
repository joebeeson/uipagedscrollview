# UIPagedScrollView

A Cocoa Touch class for easily implementing and using paged UIScrollView objects.

## Description

This class wraps UIScrollView with some functionality useful when using it with paging. A selector is fired on the delegate when the class determines that the page has been changed.

## Instance Methods

 * `scrollToPage:(int) animated:(BOOL)` Scrolls the `UIScrollView` to the requested page and animates on request.
 * `setPageCount:(int)` Configures the `UIScrollView` for the passed number of pages.

## Properties

 * `(unsigned int) page` The current visible page number.
 * `(unsigned int) pageCount` Number of pages the `UIScrollView` was configured for.

## Delegate Methods

 * `(void) scrollViewChangedPage:(int) oldPageNumber:(int)` Triggered by the class to signal a page change.

## Usage

      // Creates a UIPagedScrollView with ten pages
      UIPagedScrollView *pagedScrollView = [[UIPagedScrollView alloc] init];
      [pagedScrollView setPageCount:10];
      [pagedScrollView setDelegate:self];

      // Create the scrollViewChangedPage:oldPageNumber: method to catch page changes

## Notes

Feel free to fork and submit patches, fixes, optimizations, anything.