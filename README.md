# UIPagedScrollView

A Cocoa Touch class for easily implementing and using paged UIScrollView objects

## Description

This class wraps UIScrollView with some functionality useful when using it with paging. The delegate will receive notifications at scrollViewChangedPage:oldPageNumber: when it is determined that the current page has been changed.

## Functions
 * `scrollToPage:animated:` Scrolls the `UIScrollView` to the requested page and animates on request.
 * `setPageCount:` Configures the `UIScrollView` for the passed number of pages.

## Properties
 * `page` The current visible page
 * `pageCount` Number of pages the `UIScrollView` was configured for.

## Usage

      // Creates a UIPagedScrollView with ten pages
      UIPagedScrollView *pagedScrollView = [[UIPagedScrollView alloc] init];
      [pagedScrollView setPageCount:10];
      [pagedScrollView setDelegate:self];

      // Create the scrollViewChangedPage:oldPageNumber: method to catch page changes