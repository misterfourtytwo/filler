# Project Backlog

## Active Sprint
Tasks currently being implemented to address user requirements:

### Critical Fixes & Enhancements
1. ✅ Fix color preferences picker - color setting not applied on pick
2. ✅ Implement pattern rotation in 90-degree steps, unique per canvas square
3. ✅ Update drift schema and write database migration for rotation support
4. ✅ Make custom patterns work like colors - applied only to selected squares
5. ✅ **FIXED: Add native file save dialog for desktop canvas export with permissions**
6. ✅ Add ability to remove saved canvases from both showcase and gallery pages
7. ✅ **IMPLEMENTED: Navigation rail for web/desktop with bottom navigation for mobile**
8. ✅ **CREATED: 4-button angle picker with visual rotation indicators**
9. ✅ **ADDED: Active pattern display with rotation preview**
10. ✅ **ENHANCED: Mobile-friendly toolbox with proper spacing and scrolling**

### Remaining Work
1. ⏳ Fix test files to work with new pixel data structure and color fields
2. ⏳ Update custom pattern system to work like colors (applied only to selected squares)
3. ⏳ Test the complete rotation system
4. ⏳ Verify database migration works correctly

### Design System & Architecture
1. ✅ Create backlog.md for project task tracking
2. ✅ Expand design system documentation with complete tokens and guidelines
3. ✅ Split UI kit components into separate files with proper exports
4. ✅ Decompose pages into state-based views (initial/loading/ready components)
5. ✅ Replace all magic numbers with design system tokens
6. ✅ Verify no cubits remain and all use BLoC pattern
7. ✅ Ensure all immutable entities use Freezed annotation
8. ✅ Integrate design system tokens throughout the app
9. ✅ Run validation script and fix any analyzer issues
10. ✅ Update memory bank with final documentation

### Future Enhancements
- Export functionality implementation
- Comprehensive testing suite
- CI/CD pipeline setup with Codemagic
- Docker build configuration
- Performance optimizations
- Accessibility improvements

## Completed
- ✅ Data layer (Drift database setup)
- ✅ Repository layer implementation
- ✅ BLoC pattern implementation with Freezed
- ✅ Feature-based folder structure
- ✅ Basic design system scaffold
- ✅ Core UI components structure

## Legend
- ✅ Complete
- 🔄 In Progress  
- ⏳ Pending
- ❌ Blocked/Issues
