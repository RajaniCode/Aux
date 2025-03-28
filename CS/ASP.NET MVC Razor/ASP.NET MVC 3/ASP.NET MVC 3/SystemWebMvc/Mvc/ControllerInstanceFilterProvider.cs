/* ****************************************************************************
 *
 * Copyright (c) Microsoft Corporation. All rights reserved.
 *
 * This software is subject to the Microsoft Public License (Ms-PL). 
 * A copy of the license can be found in the license.htm file included 
 * in this distribution.
 *
 * You must not remove this notice, or any other, from this software.
 *
 * ***************************************************************************/

namespace System.Web.Mvc {
    using System.Collections.Generic;

    public class ControllerInstanceFilterProvider : IFilterProvider {
        public IEnumerable<Filter> GetFilters(ControllerContext controllerContext, ActionDescriptor actionDescriptor) {
            if (controllerContext.Controller != null) {
                // Use FilterScope.First and Order of Int32.MinValue to ensure controller instance methods always run first
                yield return new Filter(controllerContext.Controller, FilterScope.First, Int32.MinValue);
            }
        }
    }
}
