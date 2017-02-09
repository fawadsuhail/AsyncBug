# AsyncBug
Sample project highlighting a bug in AsyncDisplayKit 2.1. 

### Use Case
A simple collection view, with paging enabled, in which the size of each cell is equal to collection view's bounds with a single ASTextNode in the center. On rotation the cell size changes to use the update width and height

### Steps to replicate
- Use AyncDisplayKit 2.1 (specify version in Podfile)
- Launch the app in portrait mode
- Scroll once to the right
- Rotate to landscape
- Scroll once to the right
- Scroll back to the first cell
- Text of the first cell is misaligned 

Scrolling and rotating makes the bug more apparent. Some cells seem to retain the previous orientation's size after rotation. This doesn't happen in 2.0. 

