---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by justh.
--- DateTime: 25-Sep-22 2:11 AM
---

zalchemySelector = {}

zalchemySelector.UNIVERSAL = "*"
zalchemySelector.ATTRIBUTE_OPEN = "["
zalchemySelector.ATTRIBUTE_CLOSE = "]"
zalchemySelector.ATTRIBUTE_EQUALS = "="
zalchemySelector.ATTRIBUTE_NOT_EQUALS = "!="
zalchemySelector.ATTRIBUTE_VALUE_GREATER_THAN = ">"
zalchemySelector.ATTRIBUTE_VALUE_LESS_THAN = "<"
zalchemySelector.ATTRIBUTE_VALUE_GREATER_THAN_OR_EQUAL_TO = ">="
zalchemySelector.ATTRIBUTE_VALUE_LESS_THAN_OR_EQUAL_TO = "<="
zalchemySelector.ATTRIBUTE_CONTAINS = "*="
zalchemySelector.ATTRIBUTE_CONTAINS_WORD = "~="
zalchemySelector.ATTRIBUTE_STARTS_WITH = "^="
zalchemySelector.ATTRIBUTE_ENDS_WITH = "$="
zalchemySelector.ID = "#"
zalchemySelector.ID_WILDCARD = "*"
zalchemySelector.ID_SEPARATOR = "."
zalchemySelector.AND_GROUPING = ""
zalchemySelector.OR_GROUPING = ","
zalchemySelector.NEGATION = "!"
zalchemySelector.GENERIC_PRECEDENCE_GROUPING_OPEN = "("
zalchemySelector.GENERIC_PRECEDENCE_GROUPING_CLOSE = ")"

function zalchemySelector:parse()

end

function zalchemySelector:validate()

end

function zalchemySelector:validateDelimiters()
  return self:validateDelimitersAttribute() and self:validateDelimitersGrouping()
end

function zalchemySelector:validateDelimitersAttribute()
  local openAttributeDelimiters = 0
  local closeAttributeDelimiters = 0
  openAttributeDelimiters = string.find(self.selectorText, self.ATTRIBUTE_OPEN)
  closeAttributeDelimiters = string.find(self.selectorText, self.ATTRIBUTE_CLOSE)
  if openAttributeDelimiters ~= closeAttributeDelimiters then
    return false
  end
  local is_insideAttributeDelimiter = false
  for character in string.gmatch(self.selectorText, ".") do
    if character == self.ATTRIBUTE_OPEN then
      if is_insideAttributeDelimiter then
        --- Attribute delimiters can't be nested.  For example, [Weight[type]] is invalid.
        return false
      else
        is_insideAttributeDelimiter = true
      end
    elseif character == self.ATTRIBUTE_CLOSE then
      if is_insideAttributeDelimiter then
        is_insideAttributeDelimiter = false
      else
        --- Attribute delimiters must be matched.  For example, [Category=]extra] is invalid.
        return false
      end
    elseif character == self.GENERIC_PRECEDENCE_GROUPING_OPEN or character == self.GENERIC_PRECEDENCE_GROUPING_CLOSE then
      if is_insideAttributeDelimiter then
        --- Grouping delimiters can't go inside attribute delimiters.  Thus, [SubCategory=(this,that)] is invalid.
        return false
      end
    end
  end
  return true
end

function zalchemySelector:validateDelimitersGrouping()
  local openGroupingDelimiters = 0
  local closeGroupingDelimiters = 0
  openGroupingDelimiters = string.find(self.selectorText, self.GENERIC_PRECEDENCE_GROUPING_OPEN)
  closeGroupingDelimiters = string.find(self.selectorText, self.GENERIC_PRECEDENCE_GROUPING_CLOSE)
  if openGroupingDelimiters ~= closeGroupingDelimiters then
    return false
  end
  local groupingDelimiterNestingLevel = 0
  for character in string.gmatch(self.selectorText, ".") do
    if character == self.GENERIC_PRECEDENCE_GROUPING_OPEN then
      groupingDelimiterNestingLevel = groupingDelimiterNestingLevel + 1
    elseif character == self.GENERIC_PRECEDENCE_GROUPING_CLOSE then
      if groupingDelimiterNestingLevel <= 0 then
        --- Grouping delimiters must be balanced. For instance, item)* is invalid.
        return false
      else
        groupingDelimiterNestingLevel = groupingDelimiterNestingLevel - 1
      end
    end
  end
  return true
end

function zalchemySelector:validateTypeName()
  return true
end

function zalchemySelector:validateId()

end

function zalchemySelector:validateIdPackage()
  return true
end

function zalchemySelector:validateIdName()
  return true
end

function zalchemySelector:new(selectorText)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  o.selectorText = tostring(selectorText)
  o.is_parsed = false
  o.is_valid = nil
  return o
end