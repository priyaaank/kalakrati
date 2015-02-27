module Admin::OrderHelper

  STATE_ICON_MAP = {paid: "fa-credit-card", shipped: "fa-truck", delivered: "fa-check", cancel: "fa-times", ordered: "fa-gift", refund: "fa-reply"}
  STATE_ICON_COLOR = {paid: "primary", shipped: "info", delivered: "success", cancel: "danger", ordered: "", refund: "warning"}
  DEFAULT_ICON = "fa-info-circle"
  DEFAULT_COLOR = ""

  def timeline_node_icon_for state
    STATE_ICON_MAP[state.to_sym] || DEFAULT_ICON
  end

  def timeline_node_color_for state
    STATE_ICON_COLOR[state.to_sym] || DEFAULT_COLOR
  end

end