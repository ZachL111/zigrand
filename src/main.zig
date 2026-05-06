const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 167;
const risk_penalty: i32 = 5;
const latency_penalty: i32 = 3;
const weight_bonus: i32 = 4;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 83, .capacity = 75, .latency = 24, .risk = 14, .weight = 9 };
    try std.testing.expectEqual(@as(i32, 135), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "review"));
    const signal_case_2 = Signal{ .demand = 60, .capacity = 77, .latency = 22, .risk = 23, .weight = 12 };
    try std.testing.expectEqual(@as(i32, 64), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "review"));
    const signal_case_3 = Signal{ .demand = 71, .capacity = 76, .latency = 26, .risk = 19, .weight = 6 };
    try std.testing.expectEqual(@as(i32, 69), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "review"));
}

const DomainReview = struct {
    signal: i32,
    slack: i32,
    drag: i32,
    confidence: i32,
};

fn domainReviewScore(item: DomainReview) i32 {
    return item.signal * 2 + item.slack + item.confidence - item.drag * 3;
}

fn domainReviewLane(item: DomainReview) []const u8 {
    const value = domainReviewScore(item);
    if (value >= 140) return "ship";
    if (value >= 105) return "watch";
    return "hold";
}

test "domain review lane" {
    const item = DomainReview{ .signal = 44, .slack = 43, .drag = 17, .confidence = 57 };
    try std.testing.expectEqual(@as(i32, 137), domainReviewScore(item));
    try std.testing.expect(std.mem.eql(u8, domainReviewLane(item), "watch"));
}
